<script setup lang="ts">
import { Icon } from '@iconify/vue';
import { Link } from '@inertiajs/vue3';

type PropsType = {
  title: string;
  subtitle?: string;
};

defineProps<PropsType>();
</script>

<template>
  <div class="flex items-center md:justify-between flex-wrap gap-2 mb-4 print:hidden">
    <h4 class="text-default-900 text-lg font-semibold">{{ title }}</h4>

    <div class="md:flex hidden items-center gap-2 text-sm font-semibold">
      <Link href="" class="text-sm font-medium text-default-700">Tailwick</Link>

      <Icon icon="tabler:chevron-right" class="text-sm flex-shrink-0 text-default-500 rtl:rotate-180"></Icon>

      <Link href="" class="text-sm font-medium text-default-700">{{ subtitle }}</Link>

      <Icon icon="tabler:chevron-right" class="text-sm flex-shrink-0 text-default-500 rtl:rotate-180"></Icon>

      <Link href="" class="text-sm font-medium text-default-700" aria-current="page">{{ title }}</Link>
    </div>
  </div>
</template>
