<script setup lang="ts">
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
        <button ref="button" type="button">
            <img
                class="size-8 rounded-full bg-gray-600"
                src="https://www.infobae.com/resizer/v2/N7KFYVSTR5DZTC3TRRBYBX2A4M.jpg?auth=623de4bfca6c5eecf9bb5ca8315ee593d2f76eb33abe1965d927d2822ce02eac&smart=true&width=1200&height=1200&quality=85"
            />
        </button>

        <div
            v-show="open"
            ref="element"
            class="absolute w-full px-4 z-50 right-62 top-13"
        >
            <div
                class="bg-white w-66 py-2 text-gray-700 rounded-xl border border-gray-300 text-sm"
            >
                <Link
                    :href="route('notification-settings.index')"
                    class="w-full py-1 px-2 flex items-center"
                >
                    <svg
                        xmlns="http://www.w3.org/2000/svg"
                        fill="none"
                        viewBox="0 0 24 24"
                        stroke-width="1.5"
                        stroke="currentColor"
                        class="size-5 mr-2"
                    >
                        <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="M14.857 17.082a23.848 23.848 0 0 0 5.454-1.31A8.967 8.967 0 0 1 18 9.75V9A6 6 0 0 0 6 9v.75a8.967 8.967 0 0 1-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 0 1-5.714 0m5.714 0a3 3 0 1 1-5.714 0"
                        />
                    </svg>

                    Notificaciones
                </Link>
            </div>
        </div>
    </div>
</template>
