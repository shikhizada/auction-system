<template>
  <div>
    <h4>Open auctions</h4>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">Description</th>
          <th scope="col">Price</th>
          <th scope="col">Closing Date</th>
          <th scope="col">Action</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="item in items">
          <td>{{ item.description }}</td>
          <td>{{ item.price }} &euro;</td>
          <td>{{ item.closing_date }}</td>
          <td><a v-bind:href="'/items/'+ item.id">Select</a></td>
        </tr>
      </tbody>
    </table>
  </div>
</template>


<script>
  import axios from "axios";
  export default {
    data: function() {
      return {
        items: [],
      }
    },
    methods: {

    },
    mounted: function() {
      const vm = this;
      axios.post("/api/available_items", {})
        .then(response => {
            vm.items = response.data.items;
        }).catch(error => {
            console.log(error);
        });
    }
  }
</script>
