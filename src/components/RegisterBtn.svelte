<script>
  import { ethers } from 'ethers'
  import {
    contractAddress,
    inputNickname,
    isConnect,
    myFullAddress,
    myNickname,
    signer,
  } from '../store'

  import PNSabi from '../data/abi/PNS.json'
  import {version} from '../../package.json'

  async function setNickname() {
    const contract = await new ethers.Contract(
      $contractAddress,
      PNSabi,
      $signer
    )
    const transaction = await contract.set($myFullAddress, $inputNickname)
    await transaction.wait()
    $myNickname = await contract.nickname($myFullAddress)
    $inputNickname = null
  }

  async function register() {
    await setNickname()
  }
</script>

{#if $isConnect && $inputNickname !== null && $inputNickname !== ''}
  <div class="ableBtn" on:click={register}>
    <div class="text">
      <b>Register</b>
    </div>
  </div>
  <div>
    {version}
  </div>
{:else}
  <div class="disableBtn">
    <div class="text">
      <b>Register</b>
    </div>
  </div>
  <div>
    {version}
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
    margin-bottom: 100px;
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
    margin-top: 20px;
    margin-bottom: 100px;
    text-align: center;
  }

  .text {
    margin: 14px;
  }

  .version {
    font-size: small;
    color: $guide-color;
  }
</style>
