<?php

namespace App\Filament\Resources;

use App\Filament\Resources\SaleResource\Pages;
use App\Filament\Resources\SaleResource\RelationManagers;
use App\Models\Account;
use App\Models\Client;
use App\Models\Profile;
use App\Models\Sale;
use Carbon\Carbon;
use Closure;
use Filament\Tables\Actions\ActionGroup;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Forms\Get;
use Filament\Forms\Set;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Notifications\Notification;

class SaleResource extends Resource
{
    protected static ?string $model = Sale::class;

    protected static ?string $navigationIcon = 'heroicon-o-shopping-bag';

    protected static ?string $pluralLabel = 'Ventas';
    protected static ?string $modelLabel = 'Venta';
    protected static ?int $navigationSort = 1;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('client_id')
                    ->searchable()
                    ->label('Cliente')
                    ->required()
                    ->options(Client::where('user_id', auth()->id())->pluck('name', 'id')),

                Forms\Components\Select::make('type_account')
                    ->label('Seleccionar Tipo')
                    ->required()
                    ->live(onBlur: true)
                    ->options([
                        1 => 'Por Perfil',
                        0 => 'Cuenta Completa'
                    ])
                    ->afterStateUpdated(fn(Set $set, $state) => $set('profile_id', null)),

                // Forms\Components\Select::make('profile_id')
                //     ->searchable()
                //     ->label('Perfil')
                //     ->required()
                //     ->hidden(fn($get) => $get('type_account') != 1)
                //     ->options(Profile::where('type_account', 1)
                //         ->where('user_id', auth()->id())
                //         ->pluck('name', 'id'))
                //     ->dehydrated(),
                Forms\Components\Select::make('profile_id')
                    ->searchable()
                    ->label('Perfil')
                    ->required()
                    ->hidden(fn($get) => $get('type_account') != 1)
                    ->options(function ($component) {
                        $currentProfileId = $component->getRecord()->profile_id ?? null;

                        $query = Profile::where('user_id', auth()->id());
                        if (!$component->getRecord()) {
                            $query->where('type_account', 1);
                        } else {
                            $query->where(function ($q) use ($currentProfileId) {
                                $q->where('type_account', 1)
                                    ->orWhere('id', $currentProfileId);
                            });
                        }

                        return $query->pluck('name', 'id');
                    })
                    ->dehydrated(),


                // Forms\Components\Select::make('account_id')
                //     ->searchable()
                //     ->label('Selecciona Cuenta')
                //     ->required()
                //     ->hidden(fn($get) => $get('type_account') != 0)
                //     ->options(Account::where('type_account', 0)
                //         ->where('user_id', auth()->id())
                //         ->where('sale_status', 0)
                //         ->pluck('name', 'id'))
                //     ->dehydrated(),
                Forms\Components\Select::make('account_id')
                    ->searchable()
                    ->label('Selecciona Cuenta')
                    ->required()
                    ->hidden(fn($get) => $get('type_account') != 0)
                    ->options(function ($component) {
                        // Obtener el ID de la cuenta asociada si estamos editando
                        $currentAccountId = $component->getRecord()->account_id ?? null;

                        // Crear la consulta
                        $query = Account::where('type_account', 0)
                            ->where('user_id', auth()->id());

                        // Si estamos creando, aplicar el filtro sale_status = 0
                        if (!$component->getRecord()) { // Creación
                            $query->where('sale_status', 0);
                        } else { // Edición
                            // Si estamos editando, no aplicar el filtro sale_status en la cuenta asociada
                            // Pero sí aplicarlo para las demás
                            $query->where(function ($q) use ($currentAccountId) {
                                $q->where('sale_status', 0)  // Filtro de sale_status para las demás cuentas
                                    ->orWhere('id', $currentAccountId); // Incluye la cuenta asociada sin el filtro
                            });
                        }

                        // Obtener las opciones como un array 'id' => 'name'
                        return $query->pluck('name', 'id');
                    })
                    ->dehydrated(),


                Forms\Components\TextInput::make('price')
                    ->label('Precio')
                    ->required()
                    ->numeric()
                    ->prefix('S/.'),
                Forms\Components\Select::make('payment_method')
                    ->label('Seleccionar Pago')
                    ->options([
                        'yape' => 'Yape',
                        'plin' => 'Plin',
                        'bcp' => 'BCP',
                        'interbank' => 'Interbank',
                        'scotiabank' => 'Scotiabank',
                        'bim' => 'BIM',
                        'agora' => 'Agora'
                    ])
                    ->required(),
                Forms\Components\Hidden::make('user_id')
                    ->default(auth()->id())
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->query(Sale::where('user_id', auth()->id()))
            ->defaultSort('created_at', 'desc')
            ->columns([
                Tables\Columns\TextColumn::make('client.name')
                    ->label('Cliente')
                    ->numeric()
                    ->sortable()
                    ->searchable(),

                Tables\Columns\TextColumn::make('profile.account.email')
                    ->label('Correo')
                    ->extraAttributes(['style' => 'user-select: text;'])
                    ->default('-')
                    ->numeric()
                    ->sortable()
                    ->getStateUsing(function ($record) {
                        if ($record->profile === null) {
                            return $record->account->email ?? '-';
                        }
                        return $record->profile->account->email ?? '-';
                    })
                    ->searchable(),
                Tables\Columns\TextColumn::make('profile.name')
                    ->label('Perfil')
                    ->default('-')
                    ->numeric()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->searchable(),
                Tables\Columns\TextColumn::make('profile.account.name')
                    ->label('Cuenta')
                    ->default('-')
                    ->numeric()
                    ->sortable()
                    ->getStateUsing(function ($record) {
                        if ($record->profile === null) {
                            return $record->account->name ?? '-';
                        }
                        return $record->profile->account->name ?? '-';
                    })
                    ->searchable(),
                Tables\Columns\TextColumn::make('type_account')
                    ->label('Tipo Cuenta')
                    ->sortable()
                    ->getStateUsing(function ($record) {
                        if ($record->type_account == 1) {
                            return 'Por Perfíl';
                        } else {
                            return 'Cuenta Completa';
                        }
                    })
                    ->badge(function ($state) {
                        if ($state == 1) {
                            return [
                                'label' => 'Por Perfíl',
                            ];
                        } else {
                            return [
                                'label' => 'Cuenta Completa'
                            ];
                        }
                    })
                    ->color(fn(string $state): string => match ($state) {
                        'Por Perfíl' => 'primary',
                        'Cuenta Completa' => 'warning',
                    })
                    ->searchable(),
                Tables\Columns\TextColumn::make('price')
                    ->label('Precio')
                    ->formatStateUsing(function ($state) {
                        return 'S/. ' . number_format($state, 2, '.', ',');
                    })
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('created_at')
                    ->label('Fecha Venta')
                    ->dateTime('d-m-Y')
                    ->sortable(),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('status')
                    ->label('Estado')
                    ->getStateUsing(function ($record) {
                        $profile = Profile::where('id', $record->profile_id)->first();
                        $account = Account::where('id', $record->account_id)->first();
                        $dateFinish = $profile->date_end ?? $account->date_end;
                        $currentDate = now()->toDateString();
                        if ($dateFinish > $currentDate) {

                            $diffInDays = Carbon::parse($currentDate)->diffInDays($dateFinish);
                            if ($diffInDays <= 5) {
                                return 'Por Vencer';
                            }
                            return 'Activo';
                        } elseif ($dateFinish == $currentDate) {

                            return 'Vencido';
                        } else {
                            return 'Vencido';
                        }
                    })
                    ->badge(function ($state) {
                        if ($state == 'Activo') {
                            return [
                                'color' => 'success',
                                'label' => 'Activo',
                            ];
                        } elseif ($state == 'Por Vencer') {
                            return [
                                'color' => 'warning',
                                'label' => 'Por Vencer',
                            ];
                        } else {
                            return [
                                'color' => 'danger',
                                'label' => 'Vencido',
                            ];
                        }
                    })
                    ->color(fn(string $state): string => match ($state) {
                        'Activo' => 'success',
                        'Por Vencer' => 'warning',
                        'Vencido' => 'danger',
                        default => 'gray',
                    }),
            ])
            ->recordAction(null)
            ->filters([
                //
            ])
            ->actions([
                ActionGroup::make([
                    Tables\Actions\EditAction::make()->label('Editar'),
                    Tables\Actions\ViewAction::make()->label('Ver')->color('warning'),
                    Tables\Actions\Action::make('recordatorio-w')
                        ->label('Recordatorio W')
                        ->icon('heroicon-o-paper-airplane')
                        ->url(fn($record) => 'https://wa.me/' . $record->client->phone . '?text=' . urlencode(
                            "¡Hola {$record->client->name}! Queremos recordarte que tu membresía en " . ($record->profile ? $record->profile->account->product->name : $record->account->product->name) . " está por expirar. Aprovecha para renovarla y seguir disfrutando de nuestros servicios. Gracias"
                        ))
                        ->openUrlInNewTab()
                        ->color('success')
                        ->hidden(function ($record) {
                            $profile = Profile::where('id', $record->profile_id)->first();
                            $account = Account::where('id', $record->account_id)->first();
                            $dateFinish = $profile->date_end ?? $account->date_end;
                            $currentDate = now()->toDateString();
                            if ($dateFinish > $currentDate) {

                                $diffInDays = Carbon::parse($currentDate)->diffInDays($dateFinish);
                                if ($diffInDays <= 5) {
                                    return false;
                                }
                                return true;
                            }
                        }),
                    Tables\Actions\Action::make('recordatorio-t')
                        ->label('Recordatorio TG')
                        ->icon('heroicon-o-paper-airplane')
                        ->url(fn($record) => 'https://t.me/' . $record->client->telegram . '?text=' . urlencode(
                            "¡Hola {$record->client->name}! Queremos recordarte que tu membresía en " . ($record->profile ? $record->profile->account->product->name : $record->account->product->name) . " está por expirar. Aprovecha para renovarla y seguir disfrutando de nuestros servicios. Gracias"
                        ))
                        ->openUrlInNewTab()
                        ->color('secondary')
                        ->hidden(function ($record) {
                            $profile = Profile::where('id', $record->profile_id)->first();
                            $account = Account::where('id', $record->account_id)->first();
                            $dateFinish = $profile->date_end ?? $account->date_end;
                            $currentDate = now()->toDateString();
                            if ($dateFinish > $currentDate) {

                                $diffInDays = Carbon::parse($currentDate)->diffInDays($dateFinish);
                                if ($diffInDays <= 5) {
                                    return false;
                                }
                                return true;
                            }
                        }),
                    Tables\Actions\Action::make('renovar')
                        ->label('Renovar')
                        ->action(function ($record) {
                            $profile = $record->profile;
                            if ($profile) {
                                $newDate = Carbon::parse($profile->date_end)->addMonth();
                                $profile->update(['date_end' => $newDate]);
                                Notification::make()
                                    ->title('Tu membresía ha renovado')
                                    ->body('Fecha de finalización renovada exitosamente.')
                                    ->success()
                                    ->send();
                            } else {
                                Notification::make()
                                    ->title('Error en la renovacion')
                                    ->body('No se encontró el perfil relacionado.')
                                    ->danger()
                                    ->send();
                            }
                        })
                        ->icon('heroicon-o-arrow-path')
                        ->requiresConfirmation()
                        ->modalHeading('Renovar Perfil')
                        ->hidden(function ($record) {
                            $profile = Profile::where('id', $record->profile_id)->first();
                            $account = Account::where('id', $record->account_id)->first();
                            $dateFinish = $profile->date_end ?? $account->date_end;
                            $currentDate = now()->toDateString();
                            if ($dateFinish > $currentDate) {

                                $diffInDays = Carbon::parse($currentDate)->diffInDays($dateFinish);
                                if ($diffInDays <= 5) {
                                    return false;
                                }
                                return true;
                            }
                        }),
                    Tables\Actions\Action::make('whatsapp')
                        ->label('WhatsApp')
                        ->icon('heroicon-o-share')
                        ->url(fn($record) => 'https://api.whatsapp.com/send/?phone=' . $record->client->phone . '&text=' . urlencode(
                            "📌 Plataforma: " .
                                ($record->profile ? $record->profile->account->product->name : $record->account->product->name) . "\n" .
                                "▪ Venta a: {$record->client->name} \n" .
                                "▪ Tipo de Cuenta: " . ($record->profile ? "Por Perfil" : "Cuenta Completa") . "\n" .
                                "▪ Perfil: " . ($record->profile ? $record->profile->name : 'N/A') . "\n" .
                                "▪ Pin: " . ($record->profile ? $record->profile->pin : 'N/A') . "\n" .
                                "▪ Precio: S/.{$record->price} \n" .
                                "▪ Fecha Venta: {$record->created_at} \n" .
                                "▪ Correo: " . ($record->profile ? $record->profile->account->email : $record->account->email) . "\n" .
                                "▪ Contraseña: " . ($record->profile ? $record->profile->account->password : $record->account->password) . "\n\n" .
                                "RECUERDE QUE:\n" .
                                "✅ Solo puedes iniciar sesión en un dispositivo.\n" .
                                "🚫 Está prohibido cambiar la Contraseña.\n\n" .
                                "Gracias por su compra, estamos disponibles 24/7 para ayudarte."
                        ))
                        ->openUrlInNewTab()
                        ->color('success'),
                    // Tables\Actions\Action::make('whatsapp')
                    //     ->label('WhatsApp')
                    //     ->icon('heroicon-o-share')
                    //     ->url(fn($record) => 'https://web.whatsapp.com/send?phone=' . $record->client->phone . '&text=' . urlencode(
                    //         "📌 Plataforma: " .
                    //             ($record->profile ? $record->profile->account->product->name : $record->account->product->name) . "\n" .
                    //             "▪ Venta a: {$record->client->name} \n" .
                    //             "▪ Tipo de Cuenta: " . ($record->profile ? "Por Perfil" : "Cuenta Completa") . "\n" .
                    //             "▪ Perfil: " . ($record->profile ? $record->profile->name : 'N/A') . "\n" .
                    //             "▪ Pin: " . ($record->profile ? $record->profile->pin : 'N/A') . "\n" .
                    //             "▪ Precio: S/.{$record->price} \n" .
                    //             "▪ Fecha Venta: {$record->created_at} \n" .
                    //             "▪ Correo: " . ($record->profile ? $record->profile->account->email : $record->account->email) . "\n" .
                    //             "▪ Contraseña: " . ($record->profile ? $record->profile->account->password : $record->account->password) . "\n\n" .
                    //             "RECUERDE QUE:\n" .
                    //             "✅ Solo puedes iniciar sesión en un dispositivo.\n" .
                    //             "🚫 Está prohibido cambiar la Contraseña.\n\n" .
                    //             "Gracias por su compra, estamos disponibles 24/7 para ayudarte."
                    //     ))
                    //     ->openUrlInNewTab()
                    //     ->color('success'),
                    Tables\Actions\Action::make('telegram')
                        ->label('Telegram')
                        ->icon('heroicon-o-share')
                        ->url(fn($record) => 'https://t.me/' . $record->client->telegram . '?text=' . urlencode(
                            "📌 Plataforma: " .
                                ($record->profile ? $record->profile->account->product->name : $record->account->product->name) . "\n" .
                                "▪ Venta a: {$record->client->name} \n" .
                                "▪ Tipo de Cuenta: " . ($record->profile ? "Por Perfil" : "Cuenta Completa") . "\n" .
                                "▪ Perfil: " . ($record->profile ? $record->profile->name : 'N/A') . " - PIN: " . ($record->profile ? $record->profile->pin : 'N/A') . "\n" .
                                "▪ Precio: S/.{$record->price} \n" .
                                "▪ Fecha Venta: {$record->created_at} \n" .
                                "▪ Correo: " . ($record->profile ? $record->profile->account->email : $record->account->email) . "\n" .
                                "▪ Contraseña: " . ($record->profile ? $record->profile->account->password : $record->account->password) . "\n\n" .
                                "RECUERDE QUE:\n" .
                                "✅ Solo puedes iniciar sesión en un dispositivo.\n" .
                                "🚫 Está prohibido cambiar la Contraseña.\n\n" .
                                "Gracias por su compra, estamos disponibles 24/7 para ayudarte."
                        ))
                        ->openUrlInNewTab()
                        ->color('secondary'),
                ])
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ])->recordUrl(null);
    }

    public static function getRelations(): array
    {
        return [
            RelationManagers\AccountRelationManager::class,
            RelationManagers\ProfilesRelationManager::class,
            RelationManagers\ClientRelationManager::class,
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListSales::route('/'),
            'create' => Pages\CreateSale::route('/create'),
            'edit' => Pages\EditSale::route('/{record}/edit'),
        ];
    }
}
