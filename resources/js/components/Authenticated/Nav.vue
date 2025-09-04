<script setup lang="ts">
import { Link } from "@inertiajs/vue3";
import {
    ChevronDownIcon,
    InboxIcon,
    ChatBubbleBottomCenterTextIcon,
    Cog6ToothIcon,
} from "@heroicons/vue/24/outline";
import { HomeIcon as HomeIconSolid } from "@heroicons/vue/24/solid";
</script>

<template>
    <div class="w-68">
        <button
            class="flex text-gray-600 items-center space-x-2 mb-4 px-1 py-1 mx-3 rounded-md text-sm hover:bg-gray-300/40"
        >
            <span
                class="bg-indigo-700 text-white flex items-center justify-center rounded-lg size-10"
                >M</span
            >

            <span>Midaria SAS</span>

            <ChevronDownIcon class="size-3" />
        </button>

        <div class="divide-y divide-gray-300 space-y-4">
            <div class="px-4 pb-4 text-sm space-y-1">
                <Link
                    href="#"
                    class="hover:bg-gray-300/40 bg-indigo-300/40 text-indigo-600 p-1 rounded-md flex items-center"
                >
                    <HomeIconSolid class="size-4 mr-2 text-indigo-500" />

                    Inicio
                </Link>

                <Link
                    href="#"
                    class="hover:bg-gray-300/40 p-1 rounded-md flex items-center"
                >
                    <InboxIcon class="size-4 mr-2 text-gray-500" />

                    Bandeja de entrada
                </Link>

                <Link
                    href="#"
                    class="hover:bg-gray-300/40 p-1 rounded-md flex items-center"
                >
                    <ChatBubbleBottomCenterTextIcon
                        class="size-4 mr-2 text-gray-500"
                    />

                    Chat
                </Link>
            </div>

            <div class="px-4 pb-4 text-sm space-y-1">
                <Link
                    href="#"
                    class="hover:bg-gray-300/40 p-1 rounded-md flex items-center"
                >
                    <Cog6ToothIcon class="size-4 mr-2 text-gray-500" />

                    Configuracion
                </Link>
            </div>

            <div class="px-4 pb-4 text-sm space-y-1">
                <small class="text-gray-600 block my-2">Components</small>

                <Link
                    :href="route('components.alerts')"
                    class="hover:bg-gray-300/40 p-1 rounded-md flex items-center"
                >
                    <svg
                        xmlns="http://www.w3.org/2000/svg"
                        fill="none"
                        viewBox="0 0 24 24"
                        stroke-width="1.5"
                        stroke="currentColor"
                        class="size-4 mr-2 text-gray-500"
                    >
                        <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="M12 9v6m3-3H9m12 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z"
                        />
                    </svg>

                    Alertas
                </Link>
            </div>
        </div>
    </div>
</template>
