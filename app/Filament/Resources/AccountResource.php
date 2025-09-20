<?php

namespace App\Filament\Resources;

use App\Filament\Resources\AccountResource\Pages;
use App\Filament\Resources\AccountResource\RelationManagers;
use App\Models\Account;
use App\Models\Product;
use Carbon\Carbon;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Forms\Set;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class AccountResource extends Resource
{
    protected static ?string $model = Account::class;

    protected static ?string $navigationIcon = 'heroicon-o-cpu-chip';

    protected static ?string $pluralLabel = 'Cuentas';
    protected static ?string $modelLabel = 'Cuenta';
    protected static ?int $navigationSort = 3;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')
                    ->maxLength(255)
                    ->disabled()
                    ->dehydrated(),
                Forms\Components\TextInput::make('email')
                    ->email()
                    ->maxLength(255)
                    ->required(),
                Forms\Components\TextInput::make('password')
                    ->maxLength(255)
                    ->required(),
                Forms\Components\Select::make('product_id')
                    ->searchable()
                    ->label('Producto')
                    ->options(Product::where('user_id', auth()->id())->pluck('name', 'id'))
                    ->required()
                    ->live(onBlur: true)
                    ->afterStateUpdated(function (Set $set, $state, $get) {
                        $productId = $get('product_id');
                        $product = Product::find($productId);
                        $productName = $product ? $product->name : 'Producto Desconocido';

                        $lastId = Account::max('id');
                        $nextId = $lastId + 1;

                        $accountType = $get('state') == 1 ? 'P' : 'C';

                        $set('name', "{$accountType}-{$productName}-{$nextId}");
                    }),
                Forms\Components\Select::make('type_account')
                    ->label('Seleccionar Tipo')
                    ->required()
                    ->live(onBlur: true)
                    ->options([
                        1 => 'Por Perfil',
                        0 => 'Cuenta Completa',
                    ])
                    ->afterStateUpdated(function (Set $set, $state, $get) {
                        $set('num_profile', $state);

                        $productId = $get('product_id');
                        $product = Product::find($productId);
                        $productName = $product ? $product->name : 'Producto Desconocido';

                        $lastId = Account::max('id');
                        $nextId = $lastId + 1;

                        $accountType = $state == 1 ? 'P' : 'C';

                        $set('name', "{$accountType}-{$productName}-{$nextId}");
                    })
                    ->dehydrated(),
                Forms\Components\TextInput::make('num_profile')
                    ->label('N° Perfiles')
                    ->required()
                    ->disabled(fn($get) => $get('type_account') == 0)
                    ->dehydrated(),

                Forms\Components\DateTimePicker::make('date_start')
                    ->label('Fecha Inicio')
                    ->required(),
                Forms\Components\DateTimePicker::make('date_end')
                    ->label('Fecha Final')
                    ->required(),
                Forms\Components\Hidden::make('user_id')
                    ->default(auth()->id())
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->query(Account::where('user_id', auth()->id()))
            ->defaultSort('created_at', 'desc')
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->searchable(),
                Tables\Columns\TextColumn::make('email')
                    ->searchable(),
                Tables\Columns\TextColumn::make('product.name')
                    ->label('Producto')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('num_profile')
                    ->label('N° Perfiles')
                    ->searchable()
                    ->getStateUsing(function ($record) {
                        return $record->num_profile != 0  ? $record->num_profile : '-';
                    }),
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
                    }),

                Tables\Columns\TextColumn::make('date_start')
                    ->label('Fecha Final')
                    ->dateTime('d-m-Y')
                    ->sortable(),
                Tables\Columns\TextColumn::make('date_end')
                    ->label('Fecha Final')
                    ->dateTime('d-m-Y')
                    ->sortable(),
                Tables\Columns\TextColumn::make('estado')
                    ->label('Estado')
                    ->getStateUsing(function ($record) {
                        $dateEnd = Carbon::parse($record->date_end)->toDateString();
                        $currentDate = now()->toDateString();
                        if ($dateEnd > $currentDate) {
                            $diffInDays = Carbon::parse($currentDate)->diffInDays($dateEnd);
                            if ($diffInDays <= 5) {
                                return 'Por Vencer';
                            }
                            return 'Activo';
                        } elseif ($dateEnd == $currentDate) {

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
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make()->label(''),
                Tables\Actions\DeleteAction::make()->label(''),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListAccounts::route('/'),
            'create' => Pages\CreateAccount::route('/create'),
            'edit' => Pages\EditAccount::route('/{record}/edit'),
        ];
    }
}
