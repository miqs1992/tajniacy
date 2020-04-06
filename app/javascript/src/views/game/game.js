import axios from '../../axios';
import Tile from "../../components/tile/tile";

export default {
    name: 'game',
    components: {
        Tile
    },
    data() {
        return {
            tiles: []
        }
    },
    async created() {
        try {
            const response = await axios.get(window.location.pathname);
            console.log(response.data);
            this.tiles = response.data['data']['attributes']['tiles'];
        }
        catch(e) {
            console.log(e)
        }
    }
}
