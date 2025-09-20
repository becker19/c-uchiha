<?php

namespace App\Filament\Resources\SaleResource\RelationManagers;

use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class ClientRelationManager extends RelationManager
{
    protected static string $relationship = 'client';

    protected static ?string $modelLabel = 'Cliente';
    protected static ?string $title = 'Clientes';

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('body')
                    ->required()
                    ->maxLength(255),
            ]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('body')
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->label('Nombre'),
                // ->searchable(),
                Tables\Columns\TextColumn::make('phone')
                    // ->searchable()
                    ->getStateUsing(fn($record) => $record->phone ?? '-'),
                Tables\Columns\TextColumn::make('telegram')
                    // ->searchable()
                    ->getStateUsing(fn($record) => $record->telegram ?? '-'),
            ])
            ->filters([
                //
            ])
            ->headerActions([
                // Tables\Actions\CreateAction::make(),
            ])
            ->actions([
                // Tables\Actions\EditAction::make(),
                // Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                // Tables\Actions\BulkActionGroup::make([
                //     Tables\Actions\DeleteBulkAction::make(),
                // ]),
            ]);
    }
}
