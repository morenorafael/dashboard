<script setup lang="ts">
import { twMerge } from "tailwind-merge";
import { computed, onMounted, ref } from "vue";

const model = defineModel<string | number | null>({ required: true });

const input = ref<HTMLInputElement | null>(null);

const props = withDefaults(
    defineProps<{
        autofocus?: boolean | null;
        dusk?: string;
        name?: string;
        class?: string;
        placeholder?: string;
        type?: string;
        required?: boolean;
    }>(),
    {
        type: "text",
        required: false,
    },
);

onMounted(() => {
    if (input.value?.hasAttribute("autofocus")) {
        input.value?.focus();
    }
});

const defaultClasses = computed(() => {
    return twMerge(
        "border border-gray-200 rounded-md bg-white px-1 text-sm text-gray-400 flex justify-between items-center",
        props.class,
    );
});

defineExpose({ focus: () => input.value?.focus() });
</script>

<template>
    <div :class="defaultClasses">
        <slot name="icon" />

        <input
            class="bg-transparent outline-none ring-0 border-0 w-full text-xs text-gray-700"
            v-model="model"
            :type="type"
            :dusk="dusk"
            :required="required"
            :name="name"
            :placeholder="placeholder"
            ref="input"
        />

        <slot name="link" />
    </div>
</template>
