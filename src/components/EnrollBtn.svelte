<script>
  let able = true
</script>

{#if able}
  <div class="ableBtn">
    <div class="text">
      <b>Enroll</b>
    </div>
  </div>

  <div class="logout">Log out</div>
{:else}
  <div class="disableBtn">
    <div class="text">
      <b>Enroll</b>
    </div>
  </div>
{/if}

<style lang="scss">
  @import '../styles/Color.scss';
  .ableBtn {
    width: 343px;
    height: auto;
    background-color: $main-color;
    font-size: 20px;
    color: white;
    border-radius: 10px;
    cursor: pointer;
    margin-top: 20px;
    margin-bottom: 20px;
    text-align: center;
  }
  .ableBtn:active {
    opacity: 0.7;
  }

  .disableBtn {
    width: 343px;
    height: auto;
    background-color: $disable-color;
    font-size: 20px;
    color: white;
    border-radius: 10px;
    cursor: pointer;
    margin-top: 20px;
    margin-bottom: 100px;
    text-align: center;
  }

  .text {
    margin: 14px;
  }

  .logout {
    font-size: small;
    color: $guide-color;
    margin-bottom: 70px;
  }
</style>
