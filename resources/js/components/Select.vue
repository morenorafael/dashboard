<script setup lang="ts">
import { ref } from "vue";
import {
    Listbox,
    ListboxButton,
    ListboxLabel,
    ListboxOption,
    ListboxOptions,
} from "@headlessui/vue";
import { ChevronUpDownIcon } from "@heroicons/vue/16/solid";
import { CheckIcon } from "@heroicons/vue/20/solid";

interface IOption {
    id: number | string;
    value: string;
    avatar?: string;
}

const props = defineProps<{
    options: IOption[];
}>();

const selected = ref<IOption>(props.options[0]);
</script>

<template>
    <Listbox as="div" v-model="selected">
        <ListboxLabel class="block text-sm/6 font-medium text-gray-600"
            >Assigned to</ListboxLabel
        >
        <div class="relative mt-2">
            <ListboxButton
                class="grid w-full cursor-default grid-cols-1 rounded-md bg-white py-1.5 pr-2 pl-3 text-left text-gray-600 outline-1 -outline-offset-1 outline-gray-200 focus-visible:outline-2 focus-visible:-outline-offset-2 focus-visible:outline-indigo-600 sm:text-sm/6"
            >
                <span
                    class="col-start-1 row-start-1 flex items-center gap-3 pr-6"
                >
                    <img
                        v-if="selected.avatar"
                        :src="selected.avatar"
                        :alt="selected.value"
                        class="size-5 shrink-0 rounded-full bg-gray-100"
                    />
                    <span class="block truncate">{{ selected.value }}</span>
                </span>
                <ChevronUpDownIcon
                    class="col-start-1 row-start-1 size-5 self-center justify-self-end text-gray-500 sm:size-4"
                    aria-hidden="true"
                />
            </ListboxButton>

            <transition
                leave-active-class="transition ease-in duration-100"
                leave-from-class=""
                leave-to-class="opacity-0"
            >
                <ListboxOptions
                    class="absolute z-10 mt-1 max-h-56 w-full overflow-auto rounded-md bg-white py-1 text-base shadow-lg outline-1 outline-black/5 sm:text-sm"
                >
                    <ListboxOption
                        as="template"
                        v-for="item in options"
                        :key="item.id"
                        :value="item"
                        v-slot="{ active, selected }"
                    >
                        <li
                            :class="[
                                active
                                    ? 'bg-gray-300/40 outline-hidden'
                                    : 'text-gray-600',
                                'relative cursor-default py-2 pr-9 pl-3 select-none',
                            ]"
                        >
                            <div class="flex items-center">
                                <img
                                    v-if="item.avatar"
                                    :src="item.avatar"
                                    :alt="item.value"
                                    class="size-5 shrink-0 rounded-full"
                                />
                                <span
                                    :class="[
                                        selected
                                            ? 'font-semibold'
                                            : 'font-normal',
                                        'ml-3 block truncate',
                                    ]"
                                    >{{ item.value }}</span
                                >
                            </div>

                            <span
                                v-if="selected"
                                :class="[
                                    active ? '' : 'text-indigo-600',
                                    'absolute inset-y-0 right-0 flex items-center pr-4',
                                ]"
                            >
                                <CheckIcon class="size-4" aria-hidden="true" />
                            </span>
                        </li>
                    </ListboxOption>
                </ListboxOptions>
            </transition>
        </div>
    </Listbox>
</template>
