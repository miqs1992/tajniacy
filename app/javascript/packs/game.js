import Vue from 'vue';
import Game from '../src/views/game/game.vue';

document.addEventListener('DOMContentLoaded', () => {
    new Vue({
        render: h => h(Game)
    }).$mount('#main');
});
