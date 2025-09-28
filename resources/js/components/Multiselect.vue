<script setup lang="ts">
import {
    ChevronDownIcon,
    ChevronUpIcon,
    XMarkIcon,
} from "@heroicons/vue/24/outline";
import { ref } from "vue";

interface IOption {
    key: number | string;
    value: string;
}

const selected = ref<IOption[] | null>(null);
const open = ref<boolean>(false);

defineProps<{
    options: IOption[];
}>();

const selectOption = (option: IOption) => {
    selected.value?.push(option);
};

const clearOption = () => {
    selected.value = null;
    open.value = false;
};
</script>

<template>
    <div class="border border-gray-200 p-1 rounded-lg">
        <button
            @click="open = !open"
            class="flex items-center justify-between w-full p-1 rounded"
        >
            <span class="block" :class="{ 'text-gray-400': !selected }">{{
                selected?.value ?? "Selecciona una o varias opciones"
            }}</span>

            <div v-if="selected" class="flex space-x-1">
                <div
                    v-for="item in selected"
                    class="flex items-center space-x-2 border border-gray-200 text-gray-500 px-2 rounded-xl"
                >
                    <span>{{ item.value }}</span>

                    <button>
                        <XMarkIcon class="size-3" />
                    </button>
                </div>
            </div>

            <div class="flex space-x-2 text-gray-400 items-center">
                <button
                    @click="clearOption"
                    v-if="selected"
                    class="bg-gray-100 p-0.5 rounded-full"
                >
                    <XMarkIcon class="size-4" />
                </button>

                <ChevronUpIcon v-if="open" class="size-4" />
                <ChevronDownIcon v-else class="size-4" />
            </div>
        </button>

        <div v-show="open" class="w-full mt-2">
            <button
                @click="selectOption(option)"
                v-for="option in options"
                :key="`option-${option.key}`"
                class="hover:bg-gray-100 py-0.5 px-1 rounded w-full text-left"
            >
                {{ option.value }}
            </button>
        </div>
    </div>
</template>
