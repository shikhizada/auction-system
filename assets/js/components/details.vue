<template>
  <div>
    <h4>Auction details</h4>
    <div class="row">
      <div class="col-md-6"><p>Description:</p></div>
      <div class="col-md-6"><b>{{ item.description }}</b></div>
    </div>
    <div class="row">
      <div class="col-md-6"><p>Closing date:</p></div>
      <div class="col-md-6"><b>{{ item.closing_date }}</b></div>
    </div>
    <div class="row">
      <div class="col-md-6"><p>Current price:</p></div>
      <div class="col-md-6"><b>{{ item.price }} &euro;</b></div>
    </div>
    <div class="row">
      <div class="col-md-6">
        <input type="text" v-model="new_price" name="bid" id="bid" class="form-control" />
      </div>
      <div class="col-md-6">
        <input type="submit" v-on:click="place_bid(new_price)" name="place_bid_button" id="place_bid_button" class="btn btn-primary" value="Place bid" />
      </div>
    </div>
    <br>
    <a href="/items">Go back</a>
  </div>
</template>

<script>
  import axios from "axios";
  export default {
    data: function() {
      return {
        item: null,
        new_price: ""
      }
    },
    methods: {
      place_bid: function(new_price) {
        var item_id = window.location.href.split('items/')[1];
        const vm = this;
        axios.post("/api/place_bid", {id: item_id, new_price: parseFloat(new_price)})
          .then(response => {
              location.reload();
              alert(response.data.message);
          }).catch(error => {
              console.log(error);
          });
      }
    },
    mounted: function() {
      const vm = this;
      var item_id = window.location.href.split('items/')[1];
      axios.post("/api/selected_item", {id: item_id})
        .then(response => {
            vm.item = response.data;
        }).catch(error => {
            console.log(error);
        });
    }
  }
</script>
