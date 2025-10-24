<script setup lang="ts">
import Select from "@/components/Select.vue";
import TextInput from "@/components/TextInput.vue";
import TextInputIcon from "@/components/TextInputIcon.vue";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import Content from "@/Layouts/Content.vue";
import { EnvelopeIcon } from "@heroicons/vue/24/outline";

const inputText = "";

const people = [
    {
        id: 1,
        value: "Wade Cooper",
        avatar: "https://images.unsplash.com/photo-1491528323818-fdd1faba62cc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80",
    },
    {
        id: 2,
        value: "Arlene Mccoy",
        avatar: "https://images.unsplash.com/photo-1550525811-e5869dd03032?ixlib=rb-1.2.1&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80",
    },
    {
        id: 3,
        value: "Devon Webb",
        avatar: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2.25&w=256&h=256&q=80",
    },
    {
        id: 4,
        value: "Tom Cook",
        avatar: "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80",
    },
    {
        id: 5,
        value: "Tanya Fox",
        avatar: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80",
    },
    {
        id: 6,
        value: "Hellen Schmidt",
        avatar: "https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80",
    },
    {
        id: 7,
        value: "Caroline Schultz",
        avatar: "https://images.unsplash.com/photo-1568409938619-12e139227838?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80",
    },
    {
        id: 8,
        value: "Mason Heaney",
        avatar: "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80",
    },
    {
        id: 9,
        value: "Claudie Smitham",
        avatar: "https://images.unsplash.com/photo-1584486520270-19eca1efcce5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80",
    },
    {
        id: 10,
        value: "Emil Schaefer",
        avatar: "https://images.unsplash.com/photo-1561505457-3bcad021f8ee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80",
    },
];
</script>

<template>
    <AuthenticatedLayout>
        <div class="md:pr-4 text-sm text-gray-600">
            <Content class="divide-y divide-gray-200">
                <div class="p-3">
                    <h3 class="mb-4">Input text</h3>

                    <div class="space-y-4">
                        <TextInput v-model="inputText" />
                    </div>
                </div>

                <div class="p-3">
                    <h3 class="mb-4">Icon</h3>

                    <div class="space-y-4">
                        <TextInputIcon v-model="inputText">
                            <template #icon>
                                <EnvelopeIcon class="size-4" />
                            </template>
                        </TextInputIcon>
                    </div>
                </div>

                <div class="p-3">
                    <h3 class="mb-4">Link</h3>

                    <div class="space-y-4">
                        <TextInputIcon v-model="inputText">
                            <template #link>
                                <Link
                                    href="#"
                                    class="hover:underline decoration-dotted forgot-password text-indigo-500 block w-full text-right"
                                    >Link here</Link
                                >
                            </template>
                        </TextInputIcon>
                    </div>
                </div>

                <div class="p-3">
                    <h3 class="mb-4">Select</h3>

                    <div class="space-y-4">
                        <Select :options="people" />
                    </div>
                </div>
            </Content>
        </div>
    </AuthenticatedLayout>
</template>

D40RB
