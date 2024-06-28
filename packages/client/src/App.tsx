import { useComponentValue } from "@latticexyz/react";
import { useMUD } from "./MUDContext";
import { singletonEntity } from "@latticexyz/store-sync/recs";

export const App = () => {
  const {
    components: { Counter },
    network: { tables, useStore },
    systemCalls: { increment, toggleChecked },
  } = useMUD();

  // const counter = useComponentValue(Counter, singletonEntity);

  const checkboxes = useStore((state) => {
    const records = Object.values(state.getRecords(tables.Checkboxes));
    // records.sort((a, b) => Number(a.value.createdAt - b.value.createdAt));
    return records;
  });

  console.log('checkboxes:', checkboxes);

  return (
    <>
      <h1>Hello</h1>

      {/* <div>
        Counter: <span>{counter?.value ?? "??"}</span>
      </div>
      <button
        type="button"
        onClick={async (event) => {
          event.preventDefault();
          console.log("new counter value:", await increment());
        }}
      >
        Increment
      </button> */}
    </>
  );
};
