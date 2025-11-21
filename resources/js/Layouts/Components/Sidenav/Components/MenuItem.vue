<script setup lang="ts">
import { Icon } from '@iconify/vue';
import type { MenuItemType } from '@/types/layout';
import { computed } from 'vue';
import { Link } from '@inertiajs/vue3';
import { useRoute } from 'vue-router';

type PropsType = {
  item: MenuItemType;
};

const props = defineProps<PropsType>();

const route = useRoute();
const pathname = computed(() => route.path);

const isActive = computed(() => {
  return props.item.url && pathname.value.endsWith(props.item.url);
});
</script>

<template>
  <li class="menu-item" :class="{ active: isActive }">
    <Link :href="item.url || ''" class="menu-link" :class="{ active: isActive }">
      <span v-if="item.icon" class="menu-icon">
        <Icon :icon="item.icon" class="size-4" />
      </span>
      <span class="menu-text">{{ item.label }}</span>
      <span v-if="item.badge" class="menu-badge" :class="`bg-${item.badge.variant}`">
        {{ item.badge.text }}
      </span>
    </Link>
  </li>
</template>
