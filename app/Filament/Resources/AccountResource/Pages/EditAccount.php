<?php

namespace App\Filament\Resources\AccountResource\Pages;

use App\Filament\Resources\AccountResource;
use App\Models\Account;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;
use Illuminate\Auth\Access\AuthorizationException;

class EditAccount extends EditRecord
{
    protected static string $resource = AccountResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }

    protected function getRedirectUrl(): string
    {
        return static::getResource()::getUrl('index');
    }

    public function mount($record): void
    {
        parent::mount($record);

        // Recuperar el cliente utilizando el ID proporcionado
        $client = Account::findOrFail($record);

        // Verificar si el cliente pertenece al usuario autenticado
        if ($client->user_id !== auth()->id()) {
            throw new AuthorizationException('No tienes permiso.');
        }
    }
}
