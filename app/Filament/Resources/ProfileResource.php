<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ProfileResource\Pages;
use App\Filament\Resources\ProfileResource\RelationManagers;
use App\Models\Account;
use App\Models\Profile;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class ProfileResource extends Resource
{
    protected static ?string $model = Profile::class;

    protected static ?string $navigationIcon = 'heroicon-o-user-plus';

    protected static ?string $pluralLabel = 'Perfiles';
    protected static ?string $modelLabel = 'Perfil';
    protected static ?int $navigationSort = 2;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('pin')
                    ->maxLength(255),
                Forms\Components\Select::make('account_id')
                    ->searchable()
                    ->label('Cuenta')
                    ->required()
                    ->options(
                        Account::select('accounts.name', 'accounts.id', 'accounts.num_profile')
                            ->leftJoin('profiles', 'profiles.account_id', '=', 'accounts.id')
                            ->groupBy('accounts.id', 'accounts.name', 'accounts.num_profile')
                            ->havingRaw('COUNT(profiles.id) < accounts.num_profile')
                            ->where('accounts.user_id', auth()->id())
                            ->pluck('name', 'id')
                    ),
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
            ->query(Profile::where('user_id', auth()->id()))
            ->defaultSort('created_at', 'desc')
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->label('Nombre')
                    ->searchable(),
                Tables\Columns\TextColumn::make('account.name')
                    ->label('Cuenta')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('account.email')
                    ->label('Correo')
                    ->numeric()
                    ->sortable(),

                Tables\Columns\TextColumn::make('date_start')
                    ->label('Fecha Inicial')
                    ->dateTime('d-m-Y')
                    ->sortable(),
                Tables\Columns\TextColumn::make('date_end')
                    ->label('Fecha Final')
                    ->dateTime('d-m-Y')
                    ->sortable(),
                // Tables\Columns\TextColumn::make('created_at')
                //     ->dateTime()
                //     ->sortable()
                //     ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('type_account')
                    ->label('Estado')
                    ->sortable()
                    ->getStateUsing(function ($record) {
                        if ($record->type_account == 1) {
                            return 'Disponible';
                        } else {
                            return 'No Disponible';
                        }
                    })
                    ->badge(function ($state) {
                        if ($state == 1) {
                            return [
                                'label' => 'Disponible',
                                'color' => 'success',
                            ];
                        } else {
                            return [
                                'label' => 'No Disponible',
                                'color' => 'danger',
                            ];
                        }
                    })
                    ->color(fn(string $state): string => match ($state) {
                        'Disponible' => 'success',
                        'No Disponible' => 'danger',
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
            'index' => Pages\ListProfiles::route('/'),
            'create' => Pages\CreateProfile::route('/create'),
            'edit' => Pages\EditProfile::route('/{record}/edit'),
        ];
    }
}
