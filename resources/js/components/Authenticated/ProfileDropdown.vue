<script setup lang="ts">
import {
    ArrowLeftStartOnRectangleIcon,
    BellIcon,
    ChevronDownIcon,
    Cog6ToothIcon,
} from "@heroicons/vue/24/outline";
import { Link } from "@inertiajs/vue3";
import { onBeforeUnmount, onMounted, ref } from "vue";

const open = ref<boolean>(false);
const element = ref<HTMLDivElement | null>(null);
const button = ref<HTMLButtonElement | null>(null);

const listener = (event) => {
    if (
        event.target === button.value ||
        event.composedPath().includes(button.value)
    ) {
        open.value = !open.value;

        return;
    }

    if (
        event.target !== element.value &&
        event.composedPath().includes(element.value)
    ) {
        return;
    }

    open.value = false;
};

onMounted(() => {
    window.addEventListener("click", listener);
});

onBeforeUnmount(() => {
    window.removeEventListener("click", listener);
});
</script>

<template>
    <div class="relative">
        <button
            ref="button"
            type="button"
            class="hover:bg-gray-300/40 border hover:border-gray-300 p-1 rounded-2xl"
            :class="{
                'bg-gray-300/40 border-gray-300': open,
                'border-transparent': !open,
            }"
        >
            <div class="flex items-center space-x-2 text-xs">
                <span
                    class="bg-indigo-700 text-white size-6 flex items-center justify-center rounded-full"
                    >{{ $page.props.auth.user.first_letter_name }}</span
                >

                <ChevronDownIcon class="size-3" />
            </div>
        </button>

        <div
            v-show="open"
            ref="element"
            class="absolute w-full px-4 z-50 right-56 top-10"
        >
            <div
                class="bg-white w-66 text-gray-700 rounded-xl border border-gray-200 text-xs py-2 shadow-lg"
            >
                <div
                    class="flex text-gray-600 items-center space-x-2 mb-4 px-1 py-1 mx-3 rounded-md text-sm"
                >
                    <span
                        class="bg-indigo-700 text-white flex items-center justify-center rounded-full size-8"
                        >{{ $page.props.auth.user.first_letter_name }}</span
                    >

                    <div>
                        <h3>{{ $page.props.auth.user.name }}</h3>
                        <smal class="text-xs text-gray-400">En linea</smal>
                    </div>
                </div>
                <div class="divide-y divide-gray-200">
                    <div class="px-2 py-1">
                        <Link
                            href="#"
                            class="w-full py-1 px-2 flex items-center hover:bg-gray-300/40 rounded-md"
                        >
                            <BellIcon class="size-5 mr-2" />

                            Notificaciones
                        </Link>

                        <Link
                            href="#"
                            class="w-full py-1 px-2 flex items-center hover:bg-gray-300/40 rounded-md"
                        >
                            <Cog6ToothIcon class="size-5 mr-2" />

                            Ajustes
                        </Link>
                    </div>
                    <div class="px-2 py-1">
                        <Link
                            :href="route('logout')"
                            method="post"
                            as="button"
                            class="w-full py-1 px-2 flex items-center hover:bg-gray-300/40 rounded-md"
                        >
                            <ArrowLeftStartOnRectangleIcon
                                class="size-5 mr-2"
                            />

                            Cerrar sesión
                        </Link>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
