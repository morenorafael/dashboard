<script setup lang="ts">
import { nextTick, ref } from "vue";
import Dialog from "../Dialog.vue";
import BadgetSecondaryButton from "../BadgetSecondaryButton.vue";
import { MagnifyingGlassIcon } from "@heroicons/vue/24/outline";

const inputSearch = ref<HTMLInputElement | null>(null);
const open = ref<boolean>(false);
const term = ref<string>("");

const openDialog = () => {
    open.value = true;

    nextTick(() => inputSearch.value?.focus());
};

const closeDialog = () => {
    open.value = false;
};

const clearTerm = () => {
    term.value = "";
};
</script>

<template>
    <button
        @click="openDialog"
        class="text-sm text-left bg-white w-full md:w-96 rounded-md border border-gray-200 px-2 py-1 text-gray-500 flex items-center"
    >
        <MagnifyingGlassIcon class="size-4 mr-2" />

        Buscar
    </button>

    <Dialog :show="open" @close="closeDialog" maxWidth="2xl">
        <div class="w-full flex border-b border-gray-200">
            <input
                ref="inputSearch"
                type="text"
                v-model="term"
                class="bg-transparent outline-none ring-0 border-0 w-full"
                placeholder="Haz búsquedas, ejecuta un comando o haz una consulta…"
            />
            <button
                @click="clearTerm"
                class="hover:bg-gray-300/40 m-2 rounded-md text-gray-600 px-1"
                :class="{ hidden: term.length === 0 }"
            >
                <svg
                    xmlns="http://www.w3.org/2000/svg"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke-width="1.5"
                    stroke="currentColor"
                    class="size-4"
                >
                    <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        d="M6 18 18 6M6 6l12 12"
                    />
                </svg>
            </button>
        </div>

        <div class="">
            <div class="p-2 flex space-x-2">
                <BadgetSecondaryButton>
                    <svg
                        xmlns="http://www.w3.org/2000/svg"
                        fill="none"
                        viewBox="0 0 24 24"
                        stroke-width="1.5"
                        stroke="currentColor"
                        class="size-4"
                    >
                        <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="M9 12.75 11.25 15 15 9.75M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z"
                        />
                    </svg>

                    <span>Tareas</span>
                </BadgetSecondaryButton>

                <BadgetSecondaryButton>
                    <svg
                        xmlns="http://www.w3.org/2000/svg"
                        fill="none"
                        viewBox="0 0 24 24"
                        stroke-width="1.5"
                        stroke="currentColor"
                        class="size-4"
                    >
                        <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="M19.5 14.25v-2.625a3.375 3.375 0 0 0-3.375-3.375h-1.5A1.125 1.125 0 0 1 13.5 7.125v-1.5a3.375 3.375 0 0 0-3.375-3.375H8.25m0 12.75h7.5m-7.5 3H12M10.5 2.25H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 0 0-9-9Z"
                        />
                    </svg>

                    <span>Documentos</span>
                </BadgetSecondaryButton>

                <BadgetSecondaryButton>
                    <svg
                        xmlns="http://www.w3.org/2000/svg"
                        fill="none"
                        viewBox="0 0 24 24"
                        stroke-width="1.5"
                        stroke="currentColor"
                        class="size-3"
                    >
                        <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="M5.25 8.25h15m-16.5 7.5h15m-1.8-13.5-3.9 19.5m-2.1-19.5-3.9 19.5"
                        />
                    </svg>

                    <span>Canales</span>
                </BadgetSecondaryButton>

                <BadgetSecondaryButton>
                    <svg
                        xmlns="http://www.w3.org/2000/svg"
                        fill="none"
                        viewBox="0 0 24 24"
                        stroke-width="1.5"
                        stroke="currentColor"
                        class="size-4"
                    >
                        <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="M7.5 8.25h9m-9 3H12m-9.75 1.51c0 1.6 1.123 2.994 2.707 3.227 1.129.166 2.27.293 3.423.379.35.026.67.21.865.501L12 21l2.755-4.133a1.14 1.14 0 0 1 .865-.501 48.172 48.172 0 0 0 3.423-.379c1.584-.233 2.707-1.626 2.707-3.228V6.741c0-1.602-1.123-2.995-2.707-3.228A48.394 48.394 0 0 0 12 3c-2.392 0-4.744.175-7.043.513C3.373 3.746 2.25 5.14 2.25 6.741v6.018Z"
                        />
                    </svg>

                    <span>Mensajes</span>
                </BadgetSecondaryButton>
            </div>

            <div class="max-h-96 overflow-auto">
                <div class="text-gray-700">
                    <span class="mx-2 text-xs text-gray-500">Resultados</span>

                    <div class="my-4">
                        <Button class="hover:bg-gray-200/80 w-full py-2">
                            <div
                                class="mx-2 flex items-center space-x-2 text-left"
                            >
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    fill="none"
                                    viewBox="0 0 24 24"
                                    stroke-width="1.5"
                                    stroke="currentColor"
                                    class="size-6 mr-4"
                                >
                                    <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        d="M7.5 14.25v2.25m3-4.5v4.5m3-6.75v6.75m3-9v9M6 20.25h12A2.25 2.25 0 0 0 20.25 18V6A2.25 2.25 0 0 0 18 3.75H6A2.25 2.25 0 0 0 3.75 6v12A2.25 2.25 0 0 0 6 20.25Z"
                                    />
                                </svg>

                                <div>
                                    <h2 class="text-sm">Dev Team Dashboard</h2>
                                    <small class="text-xs text-gray-500"
                                        >panel . hace 4 semanas</small
                                    >
                                </div>
                            </div>
                        </Button>

                        <Button class="hover:bg-gray-200/80 w-full py-2">
                            <div
                                class="mx-2 flex items-center space-x-2 text-left"
                            >
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    fill="none"
                                    viewBox="0 0 24 24"
                                    stroke-width="1.5"
                                    stroke="currentColor"
                                    class="size-6 mr-4"
                                >
                                    <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        d="M7.5 14.25v2.25m3-4.5v4.5m3-6.75v6.75m3-9v9M6 20.25h12A2.25 2.25 0 0 0 20.25 18V6A2.25 2.25 0 0 0 18 3.75H6A2.25 2.25 0 0 0 3.75 6v12A2.25 2.25 0 0 0 6 20.25Z"
                                    />
                                </svg>

                                <div>
                                    <h2 class="text-sm">Dev Team Dashboard</h2>
                                    <small class="text-xs text-gray-500"
                                        >panel . hace 4 semanas</small
                                    >
                                </div>
                            </div>
                        </Button>

                        <Button class="hover:bg-gray-200/80 w-full py-2">
                            <div
                                class="mx-2 flex items-center space-x-2 text-left"
                            >
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    fill="none"
                                    viewBox="0 0 24 24"
                                    stroke-width="1.5"
                                    stroke="currentColor"
                                    class="size-6 mr-4"
                                >
                                    <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        d="M7.5 14.25v2.25m3-4.5v4.5m3-6.75v6.75m3-9v9M6 20.25h12A2.25 2.25 0 0 0 20.25 18V6A2.25 2.25 0 0 0 18 3.75H6A2.25 2.25 0 0 0 3.75 6v12A2.25 2.25 0 0 0 6 20.25Z"
                                    />
                                </svg>

                                <div>
                                    <h2 class="text-sm">Dev Team Dashboard</h2>
                                    <small class="text-xs text-gray-500"
                                        >panel . hace 4 semanas</small
                                    >
                                </div>
                            </div>
                        </Button>

                        <Button class="hover:bg-gray-200/80 w-full py-2">
                            <div
                                class="mx-2 flex items-center space-x-2 text-left"
                            >
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    fill="none"
                                    viewBox="0 0 24 24"
                                    stroke-width="1.5"
                                    stroke="currentColor"
                                    class="size-6 mr-4"
                                >
                                    <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        d="M7.5 14.25v2.25m3-4.5v4.5m3-6.75v6.75m3-9v9M6 20.25h12A2.25 2.25 0 0 0 20.25 18V6A2.25 2.25 0 0 0 18 3.75H6A2.25 2.25 0 0 0 3.75 6v12A2.25 2.25 0 0 0 6 20.25Z"
                                    />
                                </svg>

                                <div>
                                    <h2 class="text-sm">Dev Team Dashboard</h2>
                                    <small class="text-xs text-gray-500"
                                        >panel . hace 4 semanas</small
                                    >
                                </div>
                            </div>
                        </Button>
                    </div>
                </div>

                <div class="text-gray-700">
                    <span class="mx-2 text-xs text-gray-500">Comandos</span>

                    <div class="my-4">
                        <Button class="hover:bg-gray-200/80 w-full py-2">
                            <div
                                class="mx-2 flex items-center space-x-2 text-left"
                            >
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    fill="none"
                                    viewBox="0 0 24 24"
                                    stroke-width="1.5"
                                    stroke="currentColor"
                                    class="size-6 mr-4"
                                >
                                    <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        d="M7.5 14.25v2.25m3-4.5v4.5m3-6.75v6.75m3-9v9M6 20.25h12A2.25 2.25 0 0 0 20.25 18V6A2.25 2.25 0 0 0 18 3.75H6A2.25 2.25 0 0 0 3.75 6v12A2.25 2.25 0 0 0 6 20.25Z"
                                    />
                                </svg>

                                <div>
                                    <h2 class="text-sm">Dev Team Dashboard</h2>
                                    <small class="text-xs text-gray-500"
                                        >panel . hace 4 semanas</small
                                    >
                                </div>
                            </div>
                        </Button>
                    </div>
                </div>
            </div>
        </div>

        <div
            class="text-xs text-gray-600 bg-gray-100 px-2 space-x-2 leading-6 border-t border-gray-200"
        >
            <span>Escribe</span>
            <kbd class="bg-white border border-gray-200 rounded py-0.5 px-1"
                >/</kbd
            >
            <span
                >para ver los comando disponibles, pulsa la tecla de tabulación
                en un elemento seleccionado para ver acciones adicionales.</span
            >
        </div>
    </Dialog>
</template>
