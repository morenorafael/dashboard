<script setup lang="ts">
import Tab from "@/components/Tab.vue";
import Tabs from "@/components/Tabs.vue";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import Content from "@/Layouts/Content.vue";
</script>

<template>
    <AuthenticatedLayout>
        <div class="md:pr-4 px-4 text-sm text-gray-600">
            <Content class="divide-y divide-gray-200">
                <div class="p-3">
                    <h1>Welcome!</h1>
                </div>

                <div>
                    <Tabs>
                        <Tab href="#" text="Tab 1" />
                        <Tab href="#" text="Tab 2" :active="true" />
                        <Tab href="#" text="Tab 3" />
                        <Tab href="#" text="Tab 4" />
                        <Tab href="#" text="Tab 5" />
                    </Tabs>
                </div>

                <div class="p-3">
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
