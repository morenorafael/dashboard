<script setup lang="ts">
import { Link } from "@inertiajs/vue3";
import {
    ChevronDownIcon,
    HomeIcon,
    InboxIcon,
    ChatBubbleBottomCenterTextIcon,
    Cog6ToothIcon,
    StopCircleIcon,
} from "@heroicons/vue/24/outline";
import { HomeIcon as HomeIconSolid } from "@heroicons/vue/24/solid";
import { StopCircleIcon as StopCircleIconSolid } from "@heroicons/vue/24/solid";
import NavLink from "./NavLink.vue";
</script>

<template>
    <div class="w-72">
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

        <div class="divide-y divide-gray-200 space-y-4">
            <div class="px-4 pb-4 text-sm space-y-1">
                <NavLink
                    :href="route('dashboard')"
                    text="Inicio"
                    :active="route().current('dashboard')"
                >
                    <template #icon>
                        <HomeIcon class="size-4 mr-2 text-gray-500" />
                    </template>

                    <template #activeIcon>
                        <HomeIconSolid class="size-4 mr-2 text-indigo-500" />
                    </template>
                </NavLink>

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

                <NavLink
                    :href="route('components.alerts')"
                    text="Alertas"
                    :active="route().current('components.alerts')"
                >
                    <template #icon>
                        <StopCircleIcon class="size-4 mr-2 text-gray-500" />
                    </template>

                    <template #activeIcon>
                        <StopCircleIconSolid
                            class="size-4 mr-2 text-indigo-500"
                        />
                    </template>
                </NavLink>

                <NavLink
                    :href="route('components.tabs')"
                    text="Tabs"
                    :active="route().current('components.tabs')"
                >
                    <template #icon>
                        <StopCircleIcon class="size-4 mr-2 text-gray-500" />
                    </template>

                    <template #activeIcon>
                        <StopCircleIconSolid
                            class="size-4 mr-2 text-indigo-500"
                        />
                    </template>
                </NavLink>

                <NavLink
                    :href="route('components.form')"
                    text="Form"
                    :active="route().current('components.form')"
                >
                    <template #icon>
                        <StopCircleIcon class="size-4 mr-2 text-gray-500" />
                    </template>

                    <template #activeIcon>
                        <StopCircleIconSolid
                            class="size-4 mr-2 text-indigo-500"
                        />
                    </template>
                </NavLink>
            </div>
        </div>
    </div>
</template>
