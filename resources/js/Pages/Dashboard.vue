<script setup lang="ts">
import { SelectButtonOption } from "@/components/SelectButton/SelectButton";
import SelectButton from "@/components/SelectButton/SelectButton.vue";
import Tab from "@/components/Tab.vue";
import Tabs from "@/components/Tabs.vue";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import Content from "@/Layouts/Content.vue";
import { ref } from "vue";

const selected = ref(1);

const options: SelectButtonOption[] = [
    { id: 1, name: "Option 1" },
    { id: 2, name: "Option 2" },
    { id: 3, name: "Option 3" },
    { id: 4, name: "Option 4" },
];
</script>

<template>
    <AuthenticatedLayout>
        <div class="md:pr-4 text-sm text-gray-600">
            <Content class="divide-y divide-gray-200">
                <div class="p-3 items-center">
                    <h1>Welcome!</h1>
                </div>
                <Tabs>
                    <Tab text="Dashboard" href="#" active />
                    <Tab text="Alertas" href="#" />
                    <Tab text="Tabs" href="#" />
                    <Tab text="Form" href="#" />
                </Tabs>
                <div class="py-2 px-3 items-center">
                    <h1>Welcome!</h1>
                </div>
                <div class="py-2 px-3 items-center">
                    <div class="grid grid-cols-3 gap-4">
                        <div class="p-4 border border-gray-200 rounded-lg">
                            asdasd
                        </div>
                        <div class="p-4 border border-gray-200 rounded-lg">
                            asdasd
                        </div>
                        <div class="p-4 border border-gray-200 rounded-lg">
                            <SelectButton
                                v-model="selected"
                                :options="options"
                            />
                        </div>
                    </div>
                </div>
                <div class="py-2 px-3 items-center">
                    <div class="grid grid-cols-3 gap-4">
                        <div class="p-4 border border-gray-200 rounded-lg">
                            asdasd
                        </div>
                        <div class="p-4 border border-gray-200 rounded-lg">
                            asdasd
                        </div>
                        <div class="p-4 border border-gray-200 rounded-lg">
                            asdasd
                        </div>
                    </div>
                </div>
            </Content>
        </div>
    </AuthenticatedLayout>
</template>
