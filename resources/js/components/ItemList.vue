<script setup lang="ts">
import { Bars4Icon, PencilIcon, TrashIcon } from "@heroicons/vue/24/outline";
import { ref } from "vue";

const showOptions = ref<boolean>(false);

defineProps<{
    text: string;
}>();
</script>

<template>
    <li
        @mouseover="showOptions = true"
        @mouseleave="showOptions = false"
        class="flex items-center py-2 space-x-4"
    >
        <button v-show="showOptions" class="text-gray-400">
            <Bars4Icon class="size-4" />
        </button>
        <div
            class="flex items-center justify-between w-full"
            :class="{ 'ml-8': !showOptions }"
        >
            <div class="flex items-center relative">
                <span>{{ text }}</span>

                <div
                    class="flex ml-4 space-x-1 absolute -right-16"
                    v-show="showOptions"
                >
                    <slot name="options" />
                </div>
            </div>
            <slot name="fields" />
        </div>
    </li>
</template>
