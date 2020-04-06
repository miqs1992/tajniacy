<template>
    <div class="tile"
         v-bind:class="[tileData.attributes.hit ? 'hit' : '', tileData.attributes.type]">
        {{tileData.attributes.word}}
    </div>
</template>

<script src="./tile.js"></script>
<style scoped lang="scss" src="./tile.scss"></style>
