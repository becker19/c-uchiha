<x-filament-widgets::widget>
    <x-filament::section>
        <div class="flex flex-col bg-gray-800 text-white items-center justify-center p-8 pb-12 xl:px-64 xl:py-16">
            <img class="w-64" src="{{ asset('img/logo.png') }}" alt="Icon" />
            <div class="flex flex-col items-center justify-center relative z-10 text-center">
                <h1 class="text-4xl md:text-6xl font-bold leading-tight mb-4">BIENVENIDO</h1>
                <p class="text-lg md:text-xl mb-6">Contactos Oficiales:</p>
                <div class="flex space-x-4">
                    <!-- Botón de WhatsApp -->
                    <a href="https://wa.me/+51978256891" target="_blank" class="bg-green-500 text-white py-2 px-6 rounded-full font-bold hover:bg-green-600 transition duration-300 flex items-center">
                        <img src="{{ asset('svg/WhatsApp.svg') }}" alt="WhatsApp" class="w-6 h-6 mr-2">
                        WhatsApp
                    </a>
                    <!-- Botón de Telegram -->
                    <a href="https://t.me/@Stream_ClanUchiha" target="_blank" class="bg-blue-500 text-white py-2 px-6 rounded-full font-bold hover:bg-blue-600 transition duration-300 flex items-center">
                        <img src="{{ asset('svg/telegram.svg') }}" alt="Telegram" class="w-6 h-6 mr-2">
                        Telegram
                    </a>
                </div>
            </div>
        </div>
    </x-filament::section>
</x-filament-widgets::widget>