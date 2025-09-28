<script setup lang="ts">
import { twMerge } from "tailwind-merge";
import { computed, onMounted, ref } from "vue";

const model = defineModel<string | number | null>({ required: true });

const input = ref<HTMLInputElement | null>(null);

const props = defineProps<{
    autofocus?: boolean | null;
    dusk?: string;
    name?: string;
    class?: string;
}>();

onMounted(() => {
    if (input.value?.hasAttribute("autofocus")) {
        input.value?.focus();
    }
});

const defaultClasses = computed(() => {
    return twMerge(
        "border border-gray-200 rounded-md bg-white p-1 text-sm",
        props.class,
    );
});

defineExpose({ focus: () => input.value?.focus() });
</script>

<template>
    <input
        :class="defaultClasses"
        v-model="model"
        :dusk="dusk"
        :name="name"
        ref="input"
    />
</template>
