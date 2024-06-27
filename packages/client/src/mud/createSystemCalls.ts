import { getComponentValue } from "@latticexyz/recs";
import { singletonEntity } from "@latticexyz/store-sync/recs";
import { ClientComponents } from "./createClientComponents";
import { SetupNetworkResult } from "./setupNetwork";
import { Direction } from "../direction";

export type SystemCalls = ReturnType<typeof createSystemCalls>;

export function createSystemCalls(
  {
    playerEntity,
    worldContract,
    waitForTransaction,
    waitForTransaction,
  }: SetupNetworkResult,
  { Player, Position, SyncProgress }: ClientComponents
) {
  const move = async (direction: Direction) => {
    if (!playerEntity) {
      throw new Error("no player");
    }
 
    const position = getComponentValue(Position, playerEntity);
    if (!position) {
      console.warn("cannot move without a player position, not yet spawned?");
      return;
    }
 
    const tx = await worldContract.write.move([direction]);
    await waitForTransaction(tx);
  };

  const spawn = async (x: number, y: number) => {
    if (!playerEntity) {
      throw new Error("no player");
    }
 
    const canSpawn = getComponentValue(Player, playerEntity)?.value !== true;
    if (!canSpawn) {
      throw new Error("already spawned");
    }
 
    const tx = await worldContract.write.spawn([x, y]);
    await waitForTransaction(tx);
  };

  const throwBall = async () => {
    // TODO
    return null as any;
  };

  const fleeEncounter = async () => {
    // TODO
    return null as any;
  };

  return {
    move,
    spawn,
    throwBall,
    fleeEncounter,
  };
}
