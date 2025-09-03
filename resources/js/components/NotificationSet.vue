<script setup lang="ts">
import { ref } from "vue";

const model = defineModel<boolean>({ required: true });

const editing = ref<boolean>(false);
const editInput = ref<HTMLInputElement | null>(null);
const input = ref<HTMLInputElement | null>(null);

const setEditing = () => {
    editing.value = true;
    editInput.value?.focus();
};

withDefaults(
    defineProps<{
        title: string;
        route?: string;
        description?: string;
        disabled?: boolean;
        dusk?: string;
    }>(),
    {
        disabled: false,
    },
);
</script>

<template>
    <div class="flex border text-sm border-gray-300 bg-white rounded-md py-2">
        <div class="w-2/3 p-2">
            <h2 class="font-semibold" :class="{ 'text-gray-400': disabled }">
                {{ title }}
            </h2>

            <p
                v-if="description"
                class="text-xs mb-4"
                :class="{ 'text-gray-400': disabled }"
            >
                {{ description }}
            </p>
            <span
                v-show="!editing"
                @click="setEditing"
                class="text-xs hover:bg-indigo-950/20 p-1 rounded-md cursor-pointer hover:shadow"
                >{{ route }}</span
            >
            <input
                v-show="editing"
                ref="editInput"
                class="border border-gray-400 rounded-md p-1 text-xs"
                :value="route"
            />
        </div>
        <div class="grid items-center justify-end w-1/3 px-4">
            <div class="container">
                <label
                    :dusk="dusk"
                    class="flex items-center cursor-pointer select-none text-dark"
                >
                    <div class="relative">
                        <input
                            ref="input"
                            type="checkbox"
                            class="peer sr-only"
                            :disabled="disabled"
                            v-model="model"
                        />
                        <div
                            class="block h-7 rounded-full bg-gray-300 w-12"
                            :class="{ 'bg-indigo-500': model }"
                        ></div>
                        <div
                            class="absolute size-5 transition bg-white rounded-full dot left-1 top-1 peer-checked:translate-x-full peer-checked:bg-primary"
                        ></div>
                    </div>
                </label>
            </div>
        </div>
    </div>
</template>
