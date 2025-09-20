<?php

namespace App\Filament\Resources;

use App\Filament\Resources\UserResource\Pages;
use App\Filament\Resources\UserResource\RelationManagers;
use App\Models\User;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\Hash;

class UserResource extends Resource
{
    protected static ?string $model = User::class;

    protected static ?string $navigationIcon = 'heroicon-o-users';

    protected static ?string $pluralLabel = 'Usuarios';
    protected static ?string $modelLabel = 'Usuario';

    protected static ?string $navigationGroup = 'Configuración';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')
                    ->label('Nombres')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('phone')
                    ->label('Celular')
                    ->tel()
                    ->maxLength(255),
                Forms\Components\TextInput::make('username')
                    ->label('Telegram')
                    ->maxLength(255),
                Forms\Components\TextInput::make('email')
                    ->label('Correo')
                    ->email()
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('password')
                    ->label('Contraseña')
                    ->password()
                    ->maxLength(255)
                    ->nullable()
                    ->dehydrateStateUsing(fn($state) => Hash::make($state))
                    ->dehydrated(fn($state) => filled($state)),
                Forms\Components\Select::make('membership_type')
                    ->label('Tipo de membresía')
                    ->options([
                        'basic' => 'Básico'
                    ])
                    ->required(),
                Forms\Components\DateTimePicker::make('membership_start_date')
                    ->label('Inicio Menbresía'),
                Forms\Components\DateTimePicker::make('membership_end_date')
                    ->label('Fin Menbresía'),
                Forms\Components\Toggle::make('is_active')
                    ->label('Esta Activo')
                    ->required(),
                Forms\Components\Select::make('roles')->multiple()->relationship('roles', 'name')
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->searchable(),
                Tables\Columns\TextColumn::make('phone')
                    ->label('Celular')
                    ->searchable()
                    ->getStateUsing(function ($record) {
                        return $record->phone ?? '-';
                    }),
                Tables\Columns\TextColumn::make('username')
                    ->searchable()
                    ->getStateUsing(function ($record) {
                        return $record->username ?? '-';
                    }),
                Tables\Columns\TextColumn::make('email')
                    ->searchable(),
                Tables\Columns\TextColumn::make('roles.name')
                    ->label('Rol')
                    ->searchable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('membership_type')
                    ->searchable()
                    ->label('Tipo Membresía')
                    ->getStateUsing(function ($record) {
                        $type = [
                            "basic" => "Básico",
                        ];
                        return $type[$record->membership_type] ?? '-';
                    }),
                Tables\Columns\TextColumn::make('membership_start_date')
                    ->label('Inicio M.')
                    ->dateTime('d-m-Y')
                    ->sortable(),
                Tables\Columns\TextColumn::make('membership_end_date')
                    ->label('Fin M.')
                    ->dateTime('d-m-Y')
                    ->sortable(),
                Tables\Columns\IconColumn::make('is_active')
                    ->label('Estado')
                    ->boolean(),
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
            'index' => Pages\ListUsers::route('/'),
            'create' => Pages\CreateUser::route('/create'),
            'edit' => Pages\EditUser::route('/{record}/edit'),
        ];
    }
}
