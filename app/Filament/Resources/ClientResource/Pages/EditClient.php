<?php

namespace App\Filament\Resources\ClientResource\Pages;

use App\Filament\Resources\ClientResource;
use App\Models\Client;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;
use Illuminate\Auth\Access\AuthorizationException;

class EditClient extends EditRecord
{
    protected static string $resource = ClientResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }

    protected function getRedirectUrl(): string
    {
        // Aquí rediriges a la lista de productos después de la creación
        return static::getResource()::getUrl('index');
    }

    public function mount($record): void
    {
        parent::mount($record);
        $client = Client::findOrFail($record);
        if ($client->user_id !== auth()->id()) {
            throw new AuthorizationException('No tienes permiso.');
        }
    }
}
