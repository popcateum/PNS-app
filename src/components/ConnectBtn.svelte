<script>
  import { ethers } from 'ethers'
  import {
    myAddress,
    myNickname,
    provider,
    signer,
    isConnect,
    contractAddress,
    myFullAddress,
  } from '../store'

  import PNSabi from '../data/abi/PNS.json'

  let myNick

  $: if ($isConnect === true) {
    getInfo()
  }

  function changed() {
    ethereum.on('accountsChanged', async () => {
      await getAddress()
      await getNickname()
    })

    ethereum.on('chainChanged', async () => {
      await switchEthereumChain()
    })
  }

  async function requestAccount() {
    await ethereum.request({ method: 'eth_requestAccounts' })
    $isConnect = true
  }

  async function addEthereumChain() {
    await ethereum.request({
      method: 'wallet_addEthereumChain',
      params: [
        {
          chainId: '0x4bd',
          chainName: 'Popcateum',
          nativeCurrency: {
            name: 'Popcat',
            symbol: 'POP',
            decimals: 18,
          },
          rpcUrls: ['https://dataseed.popcateum.org'],
          blockExplorerUrls: ['https://explorer.popcateum.org'],
        },
      ],
    })
  }

  async function switchEthereumChain() {
    await window.ethereum.request({
      method: 'wallet_switchEthereumChain',
      params: [
        {
          chainId: '0x4bd',
        },
      ],
    })
  }

  async function connect() {
    await addEthereumChain()
    requestAccount()
    changed()
  }

  async function getInfo() {
    $provider = new ethers.providers.Web3Provider(window.ethereum)
    $signer = $provider.getSigner()
    await getAddress()
    await getNickname()
  }

  async function getAddress() {
    $myFullAddress = await $signer.getAddress()
    $myAddress = $myFullAddress.slice(0, 6) + '...' + $myFullAddress.slice(38)
  }

  async function getNickname() {
    const contract = await new ethers.Contract(
      $contractAddress,
      PNSabi,
      $signer
    )
    myNick = await contract.nickname($myFullAddress)
    $myNickname = myNick
  }
</script>

{#if $myNickname === ''}
  <div class="nickname">
    <div class="text">
      <b>No Nickname</b>
    </div>
  </div>
{:else if $isConnect && $myNickname !== null}
  <div class="nickname">
    <div class="text">
      <b>{$myNickname}</b>
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

  .nickname {
    width: 180px;
    background-color: $main-color;
    font-size: medium;
    color: white;
    border-radius: 10px;
    text-align: center;
  }

  .text {
    margin: 14px;
  }
</style>
