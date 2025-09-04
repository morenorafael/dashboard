<script setup lang="ts">
import { BellIcon, BellSnoozeIcon } from "@heroicons/vue/24/outline";
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
            class="hover:bg-gray-300/40 p-1 text-gray-500 rounded-md"
            :class="{
                'bg-gray-300/40': open,
            }"
        >
            <BellIcon class="size-6" />
        </button>

        <Transition>
            <div
                v-show="open"
                ref="element"
                class="absolute w-full px-4 right-62 top-10 z-10"
            >
                <div
                    class="bg-white w-66 text-gray-700 rounded-xl border border-gray-200 text-xs py-2 shadow-lg"
                >
                    <h2 class="font-semibold px-2 py-1">Notificaciones</h2>

                    <div class="p-2 space-y-2 overflow-auto max-h-72">
                        <div
                            class="w-full border border-dashed border-gray-300 rounded-xl p-4 flex justify-center"
                        >
                            <div>
                                <BellSnoozeIcon
                                    class="size-24 text-gray-400 rotate-35"
                                />

                                <h3 class="m-auto">Sin notificaciones</h3>
                            </div>
                        </div>
                    </div>
                    <div class="flex justify-between px-4">
                        <button class="text-gray-500 hover:font-semibold">
                            Ver todas
                        </button>
                        <button class="text-red-400 hover:font-semibold">
                            Limpiar
                        </button>
                    </div>
                </div>
            </div>
        </Transition>
    </div>
</template>

<style lang="css" scoped>
.v-enter-active,
.v-leave-active {
    transition: opacity 0.1s ease;
}

.v-enter-from,
.v-leave-to {
    opacity: 0;
}
</style>
