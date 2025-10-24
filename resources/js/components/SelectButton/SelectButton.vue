<script setup lang="ts">
import { SelectButtonOption } from "./SelectButton";

const emit = defineEmits<{
    (event: "update:modelValue", value: number): void;
}>();

const model = defineModel<number>({ required: true });

defineProps<{
    options: SelectButtonOption[];
}>();

const select = (option: SelectButtonOption) => {
    model.value = option.id;

    emit("update:modelValue", option.id);
};
</script>

<template>
    <div
        class="bg-gray-100 rounded-md p-1 space-x-2 font-semibold text-gray-400 text-sm flex items-center"
    >
        <button
            @click="select(option)"
            v-for="option in options"
            :key="option.id"
            type="button"
            class="py-0.5 px-2 w-full"
            :class="{
                'bg-white rounded-md text-gray-600 shadow-xs shadow-gray-200':
                    option.id === model,
            }"
        >
            {{ option.name }}
        </button>
    </div>
</template>
