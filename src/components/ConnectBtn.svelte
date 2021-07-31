<script>
  import { ethers } from 'ethers'
  import { myNickname } from '../store'

  let isConnect = false

  async function requestAccount() {
    await window.ethereum.request({ method: 'eth_requestAccounts' })
  }

  async function connect() {
    requestAccount()
  }
</script>

{#if isConnect}
  <div class="btn">
    <div class="text">
      <b>{myNickname}</b>
    </div>
  </div>
{:else}
  <div class="btn" on:click={connect}>
    <div class="text">
      <b>Connect to a wallet</b>
    </div>
  </div>
{/if}

<style lang="scss">
  @import '../styles/Color.scss';
  
  .btn {
    width: 180px;
    background-color: $main-color;
    font-size: medium;
    color: white;
    border-radius: 10px;
    cursor: pointer;
    text-align: center;
  }
  .btn:active {
    opacity: 0.8;
  }

  .text {
    margin: 14px;
  }
</style>
