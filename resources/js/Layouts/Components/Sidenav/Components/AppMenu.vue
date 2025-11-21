<script setup lang="ts">
import { Icon } from '@iconify/vue';
import { Link } from '@inertiajs/vue3';
</script>

<template>
    <ul class="side-nav p-3 hs-accordion-group">
        <li class="menu-title">
            <span>Title</span>
        </li>

        <li class="menu-item">
            <Link href="#" class="menu-link">
                <span class="menu-icon">
                    <Icon icon="lucide:monitor-dot" class="size-4" />
                </span>
                <span class="menu-text">Item</span>
            </Link>
        </li>
    </ul>
</template>
