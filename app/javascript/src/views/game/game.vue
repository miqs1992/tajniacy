<template>
    <div class="container">
        <div class="tiles">
            <Tile v-for="tile in tiles"
                  v-bind:key="tile.id"
                  v-bind:tileData="tile"/>
        </div>
    </div>
</template>

<script src="./game.js"></script>
<style scoped lang="scss" src="./game.scss"></style>
