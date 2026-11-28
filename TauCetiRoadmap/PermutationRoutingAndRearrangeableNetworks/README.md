# Roadmap: permutation routing and rearrangeable networks

**Summary.** A switching network connects `N` input wires to `N` output wires through small
crossbar switches; each setting of the switches realizes a permutation of the wires. This roadmap
asks which networks realize every permutation (they are *rearrangeable*), and which can add a new
connection between an idle input and an idle output without moving the existing ones (they are
*strict-sense nonblocking*). Everything is a statement about permutations, partial matchings and
colourings: a setting of two-by-two switches is a family of booleans, the realized permutation is a
composition of permutations of a restricted form, and a state of a three-stage network is a partial
matching of input ports to output ports with a middle switch for each connection.

The headline theorems are these.

- **Clos's theorem.** A symmetric three-stage Clos network with `r ≥ 2` input switches and `r`
  output switches of `n` ports each and `m` middle switches is strict-sense nonblocking exactly
  when `m ≥ 2n − 1`. With a single input switch the threshold is `m ≥ n` instead, so `r ≥ 2` is
  needed.
- **The Slepian–Duguid theorem.** The same network is rearrangeable exactly when `m ≥ n` (or
  `r = 0`). Already with `r = 2` and `m = n = 2` it is rearrangeable but blocking.
- **Beneš's theorem with Waksman's count.** The recursive Beneš network of two-by-two switches on
  `N = 2^(k+1)` wires realizes every permutation, even with one output switch of every subnetwork
  held straight, which leaves `N log₂ N − N + 1` free switches. A butterfly, half a Beneš network,
  realizes each permutation by at most one setting, and for `N ≥ 4` it misses some.
- **Sorting networks are permutation networks.** Read as a network of switches, every comparator
  network that sorts realizes every permutation of its wires.

The roadmap builds on two roadmaps. GraphConnectivityAndFlows supplies Kőnig's edge-colouring
theorem for bipartite multigraphs, which gives the Slepian–Duguid theorem and, through it, the
recursive step of the Beneš network. ComparisonSortingAndSelection supplies comparator networks and
the zero–one principle, used for the last theorem.

Layer 1 treats three-stage Clos networks: Clos's theorem by counting and the Slepian–Duguid theorem
by edge-colouring. Layer 2 treats recursive networks of two-by-two switches: the Beneš network with
Waksman's refinement, and the butterfly. Layer 3 reads sorting networks as
switching networks.

## Conventions

- **Permutations and signal order.** A permutation `π : Equiv.Perm (Fin N)` of the wires is read as
  a map: the signal entering on wire `i` leaves on wire `π i`. Networks in series compose by
  `Equiv.trans`, the first network first: `(a.trans b) i = b (a i)`.
- **Switch settings.** A two-by-two switch is set by a boolean, `true` meaning that it exchanges its
  two wires. A column of `m` switches acts on the wires `Fin (m * 2)`, wire `2j + b` (`b < 2`) being
  port `b` of switch `j`; this is Mathlib's `finProdFinEquiv`, which sends `(j, b)` to `b + 2j`.
  `switchCol s` is the column with setting `s : Fin m → Bool`.
- **Two subnetworks side by side.** `subnetworkPair u l` sends wire `2j` to `2 (u j)` and wire
  `2j + 1` to `2 (l j) + 1`: port `0` of every switch of a column feeds the first subnetwork and
  port `1` the second, at the position of the switch, and output `j` of subnetwork `b` feeds port
  `b` of switch `j` of the next column. No shuffle of wires is needed in this indexing.
- **Recursive networks.** The Beneš network and the butterfly are indexed by `k` and have
  `2 ^ (k + 1)` wires, so the one-wire network never occurs. `BenesSetting 0 = Bool` (one switch);
  a setting at level `k + 1` is an input column, two settings at level `k` and an output column, and
  `benesPerm (k + 1)` is `switchCol sIn`, then `subnetworkPair` of the two half-size networks, then
  `switchCol sOut`. In the usual notation `N = 2^n` with `n = k + 1 ≥ 1`, the network has `2n − 1`
  columns of `N/2` switches. `ButterflySetting` and `butterflyPerm` are the same recursion without
  the output column: `n` columns of `N/2` switches. Both are defined by structural recursion on `k`.
- **Three-stage Clos networks.** The symmetric Clos network has `r` input switches and `r` output
  switches with `n` ports each, and `m` middle switches; every input switch has one link to every
  middle switch, and every middle switch one link to every output switch. Ports are
  `Fin r × Fin n` (switch, port), and middle switches are the natural numbers below `m`. A state
  is a set `A` of busy input ports, an output port `τ z` and a middle switch `c z` for each
  `z ∈ A`, with `c` valued in `ℕ`; it is *routed* (`IsRoutedState m A τ c`) when `τ` is injective
  on `A`, `c z < m` for `z ∈ A`, and two distinct connections sharing an input switch or an output
  switch use distinct middle switches. Values of `τ` and `c` off `A` play no role. Inside a switch
  every matching of its ports to its links can be set, so a routed state is exactly a set of
  connections that can coexist (Paull's matrix: Giaccone, slide 24).
- **Nonblocking and rearrangeable.** `StrictSenseNonblocking r n m`: for every routed state, every
  idle input port `x` and every idle output port `y` (not of the form `τ z` with `z ∈ A`), some
  middle switch `μ` makes the state with the extra connection `x ↦ y` through `μ` routed, the other
  connections unchanged. `Rearrangeable r n m`: for every permutation `σ` of the ports there are
  middle switches `c` with `IsRoutedState m univ σ c`. These are the two notions of Giaccone,
  slide 7, for the symmetric Clos network.

**Checks.**

- On four wires, `switchCol` with switch `0` exchanging and switch `1` straight is the permutation
  `[1, 0, 2, 3]` (the list of images of `0, 1, 2, 3`), and `subnetworkPair` of the transposition of
  `0, 1` with the identity is `[2, 1, 0, 3]`.
- The two notions differ: for `r = 2` and `n = m = 2` the network is rearrangeable (every one of
  the `24` permutations of the four ports is routed) but not strict-sense nonblocking. A blocking
  state: input port `(0, 1)` connected to output port `(0, 1)` through middle switch `0`, input
  port `(1, 1)` to output port `(1, 1)` through middle switch `1`; the new call from `(0, 0)` to
  `(1, 0)` finds switch `0` busy at its input switch and switch `1` busy at its output switch.
  Dropping the output-switch condition from the definition of a routed state would let middle
  switch `1` carry the new call, and would make this network nonblocking.
- With ports but no middle switch (`r, n ≥ 1`, `m = 0`) the network is neither strict-sense
  nonblocking nor rearrangeable: the empty state is routed and no call can be added to it, and no
  permutation is routed, since a busy port would need a middle switch below `0`. Had
  middle switches been a function into a type with `m` elements, there would be no state at all
  for `m = 0`, and the network would count as nonblocking.

## Layer 1: three-stage Clos networks

### 1.1 Clos's theorem

For `r ≥ 2`, `StrictSenseNonblocking r n m` holds if and only if `2n − 1 ≤ m`
(`strictSenseNonblocking_iff`). The subtraction is in `ℕ`: for `n = 0` there are no ports, the
network is trivially nonblocking, and `2 · 0 − 1 = 0 ≤ m`, so the statement holds there too
(Giaccone, slide 22, the symmetric case `m1 = n3 = n`; Clos, 1953).

Route (proved here; the "if" half is the source's count, and the "only if" half exhibits a
blocking state).

- *If.* Let `n ≥ 1`, a routed state `(A, τ, c)`, an idle input `x` and an idle output `y` be
  given. The connections of `A` at the input switch of `x` use ports of that switch other than `x`,
  so there are at most `n − 1` of them. The connections of `A` ending at the output switch of `y`
  go, by injectivity of `τ` on `A`, to distinct ports of that switch other than `y`, so there are at
  most `n − 1` of them. Their middle switches are at most `2n − 2 < m` values, so some `μ < m` is
  used by none of them. The extended state is routed: `τ` stays injective because no `τ z` equals
  `y`; pairs inside `A` are unchanged because both differ from `x`; and a pair `(z, x)` that shares
  an input or an output switch has `z` in one of the two sets above, so `c z ≠ μ`.
- *Only if.* Let `m < 2n − 1`, so `n ≥ 1` and `m ≤ 2n − 2`, and let `g = min(n − 1, m)`. Connect
  input port `(0, i)` to output port `(0, i)` through middle switch `i − 1` for `1 ≤ i ≤ g`, and
  input port `(1, i)` to output port `(1, i)` through middle switch `g + i − 1` for `1 ≤ i ≤ m − g`;
  this uses `r ≥ 2`, and `m − g ≤ n − 1` because `g = m` or `g = n − 1`. Within each group all
  connections share a switch and have distinct middle switches; connections of different groups
  share no switch; so the state is routed. The call from `x = (0, 0)` to `y = (1, 0)` is between
  idle ports, and every middle switch `μ < m` is used either at the input switch `0` (by the first
  group) or at the output switch `1` (by the second), so no `μ` extends the state. For `m = 0` the
  state is empty and the call fails because there is no middle switch.

**Checks.**

- Exhaustive search over all routed states and all calls agrees with the theorem for `r = 2, 3`,
  `n ≤ 3` and `m ≤ 5`, except `r = n = 3`. By the symmetry of switches and ports the call can be
  taken from input port `(0, 0)` to output port `(0, 0)`.
- The blocking state of the route is routed and blocks the call from `(0, 0)` to `(1, 0)` for
  `r = 2, 3`, `n ≤ 5` and every `m ≤ 2n − 2`.
- `r ≥ 2` is needed: for `r = 1` every connection uses the only input switch and the only output
  switch, at most `n − 1` connections are busy when a call arrives, and the network is nonblocking
  exactly when `n ≤ m`; for `r = 1`, `n = m = 2` it is nonblocking although `2n − 1 = 3 > 2`
  (exhaustive). For `r = 0` it is nonblocking for every `n` and `m`.

*Needs:* Mathlib `Finset.card_le_card`, `Set.InjOn`, `Function.update`.

### 1.2 The Slepian–Duguid theorem

`Rearrangeable r n m` holds if and only if `r = 0` or `n ≤ m` (`rearrangeable_iff`) (Giaccone,
slide 26, the symmetric case, where the proof is not given).

Route (proved here).

- *Only if.* Let `r ≥ 1` and route the identity permutation. The `n` ports of input switch `0`
  share that switch, so their middle switches are distinct numbers below `m`, and `n ≤ m` by
  `Finset.card_le_card_of_injOn`.
- *If.* For `r = 0` there are no ports. Let `n ≤ m` and a permutation `σ` be given. Form the
  multigraph `G : Graph (Fin r ⊕ Fin r) (Fin r × Fin n)` of Mathlib with every vertex actual, in
  which the edge `x` joins `inl x.1` (an input switch) to `inr (σ x).1` (an output switch); its edge
  set is all of `Fin r × Fin n`. The sides `inl` and `inr` form an `IsBipartition` in the sense of
  GraphConnectivityAndFlows §6.7. The edges at `inl i` are the `n` ports of switch `i`; the edges at
  `inr j` are the ports `x` with `σ x` on switch `j`, again `n` of them because `σ` is a bijection.
  So every `Graph.incidenceCount` is `n ≤ m`, and GraphConnectivityAndFlows §6.9
  `exists_edgeColoring_iff` with `k = m` gives `c : G.edgeSet → Fin m` with distinct colours on
  distinct edges at a common vertex. Two distinct ports on one input switch are distinct edges at
  the same `inl` vertex, and two distinct ports whose images lie on one output switch are distinct
  edges at the same `inr` vertex, so the values of `c`, read on ports as natural numbers below `m`,
  route `σ`.

**Checks.**

- Exhaustive search over all permutations of the ports agrees with the theorem for all
  `r, n, m ≤ 3`; for `r = n = 3` and `m < 3` the identity alone already fails.
- For `r = 2` and `n = m = 2` the network is rearrangeable but blocking (Conventions).

*Needs:* GraphConnectivityAndFlows §6.7 `IsBipartition`, §6.9 `exists_edgeColoring_iff`; Mathlib
`Graph`, `Finset.card_le_card_of_injOn`; Tau Ceti `Graph.incidenceCount`.

### Examples

- For `r = 2` and `n = 2` the network is rearrangeable with `m = 2` and strict-sense nonblocking
  with `m = 3`, not with `m = 2`.
- For `r = 2` and `n = 3` the network is rearrangeable with `m = 3` and not with `m = 2`.

### Dependencies

Layer 1 uses GraphConnectivityAndFlows §§6.7 and 6.9 (for 1.2), Mathlib and Tau Ceti.

## Layer 2: Beneš networks and butterflies

### 2.1 Beneš's theorem with Waksman's refinement

`benesPerm_surjective`: for every `k`, with `N = 2 ^ (k + 1)` wires,

- (a) every permutation of the wires is realized by a setting with `IsWaksman k`: in the whole
  network and in every subnetwork of the recursion, output switch `0` of the output column is
  straight; in particular `benesPerm k` is surjective, and the Beneš network realizes every
  permutation of its wires;
- (b) the Beneš network has `(2k + 1) 2 ^ k` switches: `Nat.card (BenesSetting k)` is
  `2 ^ ((2k + 1) 2 ^ k)`;
- (c) Waksman's settings leave `k 2 ^ (k + 1) + 1 = N log₂ N − N + 1` switches free:
  `Nat.card {s // IsWaksman k s} = 2 ^ (k 2 ^ (k + 1) + 1)`.

Sources: the recursion on two half-size networks with a two-colouring of the conflicts at the
outer columns is Lehman, Leighton and Meyer, *Mathematics for Computer Science*, Theorem 11.3.2
(p. 490) with Lemma 11.3.3 (p. 492), stated there in a model whose switches are graph vertices and
whose claim is congestion one; Giaccone, slide 36, describes the Beneš network as the Clos network
with `n = 2` factored recursively, and slide 38 counts its `2 log₂ N − 1` stages. The count
`N log₂ N − N + 1` and the counting remark on `log₂ N!` are in the abstract of Waksman (1968). The
theorem is Beneš's (1964). The proof below is written out in this roadmap's model.

Route (proved here), by induction on `k`.

- *k = 0.* `Equiv.Perm (Fin 2)` consists of the identity and the transposition of `0` and `1`, the
  two values of `benesPerm 0`; `IsWaksman 0` holds for both settings.
- *Step, (a).* Let `σ` be a permutation of the `2 ^ (k + 2)` wires, which are `Fin (M * 2)` with
  `M = 2 ^ (k + 1)` (the two types are the same by `pow_succ`). Transport `σ` along
  `finProdFinEquiv` to a permutation `ρ` of `Fin M × Fin 2`: `ρ (j, b)` is the (output switch, port)
  of the wire to which `σ` sends port `b` of input switch `j`. By 1.2 with `r = M` and `n = m = 2`
  there is `c : Fin M × Fin 2 → ℕ` with `IsRoutedState 2 univ ρ c`, whose values, the colours, are
  `0` and `1`: the two ports of every input switch get distinct colours, and so do the two ports
  that `ρ` sends to the same output switch. Replacing `c` by `1 − c` keeps it routed (the colours
  stay below `2`, and the conditions only say that two colours differ), so we may assume that the
  port `ρ⁻¹ (0, 0)` has colour `0`. Set `sIn j` true when `c (j, 0) = 1`, and
  `sOut j'` true when the port `ρ⁻¹ (j', 0)` has colour `1`; then `sOut 0 = false`. For `b < 2` let
  `π_b (j)` be the output switch `(ρ z).1` of the port `z` of input switch `j` with colour `b`
  (there is exactly one). `π_b` is injective, since two ports of colour `b` sent to one output
  switch would contradict the routing, hence a permutation of `Fin M`. By induction take Waksman
  settings `u, l` with `benesPerm k u = π_0` and `benesPerm k l = π_1`, and let
  `s = (sIn, (u, l), sOut)`; it satisfies `IsWaksman (k + 1)`. Follow port `b` of input switch `j`,
  with `z = (j, b)`: since `c (j, b) = c (j, 0) + b` modulo `2`, the input column sends it to port
  `c z` of switch `j`; `subnetworkPair` sends it to port `c z` of output switch `j' = (ρ z).1`; the
  other port arriving there has the other colour. If `(ρ z).2 = 0`, then `sOut j'` is true exactly
  when `c z = 1`, so the signal leaves on port `0`; if `(ρ z).2 = 1`, the port `ρ⁻¹ (j', 0)` has
  colour `1 − c z`, `sOut j'` is true exactly when `c z = 0`, and the signal leaves on port `1`. So
  `benesPerm (k + 1) s` sends each wire where `σ` does.
- *(b)* By `Fintype.card_fun` and `Nat.card_prod`, the count at `k + 1` is
  `2 ^ M · (2 ^ ((2k + 1) 2 ^ k))² · 2 ^ M = 2 ^ ((2k + 3) 2 ^ (k + 1))`, and at `0` it is `2`.
- *(c)* At level `k + 1` the Waksman settings are equivalent to the product of the input columns,
  the Waksman settings at level `k` twice, and the output columns with value `false` at `0`; the
  last are equivalent to `Fin (M − 1) → Bool` by `Fin.consEquiv` (as `M ≥ 1`). The exponent is
  `M + 2 (k 2 ^ (k + 1) + 1) + M − 1 = (k + 1) 2 ^ (k + 2) + 1`, and at `0` the count is `2`.

**Checks.**

- Exhaustive enumeration: on `2` and `4` wires all settings realize all `2` and `24` permutations
  (`2` and `64` settings, `(2k + 1) 2 ^ k = 1, 6` switches); the Waksman settings (`2`, `32`) also
  realize all of them. On `8` wires the `2 ^ 17` Waksman settings realize all `40320` permutations.
- Counting comparison: `t` two-state switches have `2 ^ t` settings, so a family of them that
  realizes all `N!` permutations has `N! ≤ 2 ^ t`, that is `⌈log₂ N!⌉ ≤ t`. Against Waksman's
  `k 2 ^ (k + 1) + 1 = N log₂ N − N + 1` free switches: `⌈log₂ N!⌉ ≤ k 2 ^ (k + 1) + 1` for
  `k ≤ 7`; on four wires both are `5`, so no family of fewer switches realizes all `24`
  permutations; on eight wires they are `17` and `16`.

*Needs:* 1.2; Mathlib `finProdFinEquiv`, `Equiv.prodCongrRight`, `Equiv.prodCongrLeft`,
`Fintype.card_fun`, `Nat.card_prod`, `Fin.consEquiv`.

### 2.2 Butterflies

`butterflyPerm_injective`: for every `k`, `butterflyPerm k` is injective, the butterfly has
`(k + 1) 2 ^ k` switches (`Nat.card (ButterflySetting k) = 2 ^ ((k + 1) 2 ^ k)`), and
`butterflyPerm k` is surjective if and only if `k = 0`. In the usual notation the butterfly on
`N = 2^n` wires has `n` columns of two-by-two switches, each input is joined to each output by
exactly one path (Lehman, Leighton and Meyer, §11.3.2, p. 488, in their model whose switches are
graph vertices), and for `N ≥ 4` it does not realize every permutation.

Route (proved here).

- *Injective,* by induction. At `k = 0` the two settings give the identity and the transposition.
  At `k + 1` write `π` for the realized permutation and follow port `b` of input switch `j`: the
  input column sends it to port `b'` (`b' = b` exactly when `s j` is false), and the subnetwork `b'`
  sends it to port `b'` of position `(butterflyPerm k (u or l)) j`. So the port of `π (j, 0)` is
  `1` exactly when `s j` is true: `π` determines `s`. Then `butterflyPerm k u j` is the switch of
  `π (j, b)` for the `b` with `b' = 0`, so `π` and `s` determine `butterflyPerm k u`, hence `u` by
  induction, and likewise `l`.
- *Count:* `2 = 2 ^ 1` at `0`, and `2 ^ M · (2 ^ ((k + 1) 2 ^ k))² = 2 ^ ((k + 2) 2 ^ (k + 1))`.
- *Surjective iff `k = 0`:* at `k = 0` both permutations of `Fin 2` occur. For `k ≥ 1` let
  `N = 2 ^ (k + 1) ≥ 4`. Pairing the factors, `(N!)² = ∏_{i=1}^{N} i (N + 1 − i)`, and
  `i (N + 1 − i) − N = (i − 1)(N − i) ≥ 0`, with strict inequality at `i = 2` since `N ≥ 3`. So
  `(N!)² > N ^ N = (2 ^ ((k + 1) 2 ^ k))²`, the number of settings is smaller than `N!`, and the map
  is not surjective.

**Checks.**

- Exhaustive enumeration: on `2`, `4` and `8` wires the `2`, `16` and `4096` settings give distinct
  permutations; `16 < 24` and `4096 < 40320`.
- `2 ^ ((k + 1) 2 ^ k) < (2 ^ (k + 1))!` for `1 ≤ k ≤ 6`, and equality `2 = 2!` at `k = 0`: the
  strict inequality needs `k ≥ 1`.

*Needs:* 2.1 (the definitions `switchCol`, `subnetworkPair`); Mathlib `Fintype.card_fun`,
`Nat.card_prod`, `Fintype.card_perm`, `Fintype.card_le_of_surjective`.

### Examples

- Four wires: the Beneš network has three columns of two switches; the butterfly has two columns
  and realizes `16` of the `24` permutations, each by exactly one setting.
- Eight wires: `20` Beneš switches, of which Waksman's settings leave `17` free, against the
  counting bound `16`; the butterfly has `12` switches and realizes `4096` permutations.

### Dependencies

2.1 uses 1.2. 2.2 uses the definitions of 2.1. Both use Mathlib.

## Layer 3: sorting networks as permutation networks

### 3.1 Every sorting network routes every permutation

The comparator networks are those of ComparisonSortingAndSelection §4.1, with `Network`,
`comparator`, `Network.apply` and `Network.Sorts` copied verbatim from there.
`Network.switchPerm c s` reads the network `c` as a network of switches: under the setting
`s : Fin c.length → Bool`, the comparator at position `i` of the list exchanges its two wires when
`s i` is true and does nothing otherwise, and the switches act in the order of the list. A
comparator `(p, p)` on a single wire is a switch that does nothing either way.

`Network.switchPerm_surjective`: if `c` sorts `Bool` (`c.Sorts Bool`), then every permutation of the
wires is `c.switchPerm s` for some setting `s`.

Route (proved here). Let `σ` be given and feed the input `x i = σ i` (as a natural number) to the
network. Record `s i` as true exactly when the comparator at position `i`, applied to the values it
receives, has the larger value on its first wire, so that it exchanges them. By induction along the
list, for every input with distinct values, the output `y = c.apply x` satisfies
`y (c.switchPerm s i) = x i` for every wire `i`: a comparator that exchanges moves the values as the
transposition does, and one that does not exchange leaves its input unchanged; in particular the
values stay distinct. By ComparisonSortingAndSelection §4.2 `sorts_of_sorts_bool` the network sorts
`ℕ`, so `y` is monotone. Writing `π = c.switchPerm s`, the identity above says that `y` is the
value in `ℕ` of the permutation `τ = π⁻¹.trans σ` of `Fin n`. So `τ` is monotone and injective,
hence strictly monotone (`Monotone.strictMono_of_injective`); being also surjective it is an order
isomorphism (`StrictMono.orderIsoOfSurjective`), and the only order isomorphism of `Fin n` is the
identity (`OrderIso.subsingleton_of_wellFoundedLT`). Hence `π i = σ i` for every `i`.

**Checks.**

- Exhaustive: every comparator network of length `3` on `2` wires, `4` on `3` wires and `5` on `4`
  wires that sorts all inputs of zeros and ones realizes, read as switches, all permutations of its
  wires; for the five-comparator sorter `(0,1), (2,3), (0,2), (1,3), (1,2)` on four wires, the
  exchange record on the input `σ` realizes `σ` for each of the `24` permutations.
- The converse fails: the single comparator `(1, 0)` on two wires realizes both permutations but
  puts the larger value on wire `0`, so it does not sort.

*Needs:* ComparisonSortingAndSelection §4.1 (definitions, copied) and §4.2 `sorts_of_sorts_bool`;
Mathlib `Monotone.strictMono_of_injective`, `StrictMono.orderIsoOfSurjective`,
`OrderIso.subsingleton_of_wellFoundedLT`.

### Examples

- The five-comparator sorter on four wires realizes all `24` permutations with its `32` settings.

### Dependencies

Layer 3 uses ComparisonSortingAndSelection §§4.1–4.2 and Mathlib. It does not use Layers 1 and 2.

## Scope and ownership

This roadmap owns the notions of a routed state, strict-sense nonblocking and rearrangeable
three-stage Clos networks, Clos's theorem and the Slepian–Duguid theorem for the symmetric network;
the recursive Beneš network with Waksman's refinement and its switch counts; the butterfly; and the
reading of comparator networks as switching networks with the theorem that sorting networks realize
every permutation.

- ComparisonSortingAndSelection owns comparator networks (§4.1, copied here verbatim), the
  zero–one principle (§4.2, used), the bound of `⌈log₂ n!⌉` comparators for a sorting network
  (§4.3), Batcher's networks and the primitive networks of its Layer 5; none of these is restated.
- GraphConnectivityAndFlows owns bipartitions of multigraphs (§6.7) and Kőnig's edge-colouring
  theorem for bipartite multigraphs (§6.9); both are used in 1.2 and not restated.
- Mathlib's Hall marriage theorem (`Finset.all_card_le_biUnion_card_iff_exists_injective`) and
  its Birkhoff–von Neumann theorem (`doublyStochastic_eq_convexHull_permMatrix`) are not used.
- Not treated here: asymmetric Clos networks (different numbers or sizes of input and output
  switches, where the threshold `m ≥ 2n − 1` needs further hypotheses on the sizes); wide-sense
  nonblocking networks; Paull's bound on the number of connections to rearrange; Beneš and Waksman
  networks for a number of wires that is not a power of two; multicast networks; routing on
  hypercubes and butterflies with queues; algorithms for setting the switches.

These are standard facts about switching and sorting networks. The preprint *The matrix
multiplication exponent is nine fourths* (OpenAI, 2026; public repository `openai/math`) uses a
coordinate factorization of a rearrangeable network by bipartite edge-colouring, citing Beneš, and
sorting networks in its routing sections; nothing here rests on it, and none of its results is
stated.

## Exact supplier contracts

### From Mathlib

- `finProdFinEquiv : Fin m × Fin n ≃ Fin (m * n)` (`Mathlib/Logic/Equiv/Fin/Basic.lean`), sending
  `(a, b)` to `b + n a`.
- `Equiv.prodCongrRight`, `Equiv.prodCongrLeft` (`Mathlib/Logic/Equiv/Prod.lean`), acting on the
  second and the first factor of a product, the equivalence depending on the other factor.
- `Graph α β` (`Mathlib/Combinatorics/Graph/Basic.lean`): a multigraph with vertex set, edge set
  and the incidence relation `IsLink`, and `Graph.Inc`.
- `Finset.card_le_card_of_injOn` (`Mathlib/Data/Finset/Card.lean`): an injective map from `s`
  into `t` gives `s.card ≤ t.card`.
- `Fintype.card_le_of_surjective` (`Mathlib/Data/Fintype/Card.lean`), `Fintype.card_perm`
  (`Mathlib/Data/Fintype/Perm.lean`, `[DecidableEq α] [Fintype α]`), `Fintype.card_fun`,
  `Nat.card_prod`, `Fin.consEquiv`.
- `Monotone.strictMono_of_injective`, `StrictMono.orderIsoOfSurjective` (a strictly monotone
  surjection from a linear order is an order isomorphism), `OrderIso.subsingleton_of_wellFoundedLT`
  (`Mathlib/Order/Hom/Set.lean`: at most one order isomorphism from a well-founded linear order).

### From Tau Ceti

- `Graph.incidenceCount` (`TauCeti/Combinatorics/Graph/Incidence.lean`): the number of edges
  incident with a vertex, the degree used by GraphConnectivityAndFlows §6.9.

### From TauCetiRoadmap.GraphConnectivityAndFlows

- §6.7 `IsBipartition G L R`: disjoint finite sides covering the actual vertices, every edge
  joining the two sides.
- §6.9 `exists_edgeColoring_iff` (Kőnig's edge-colouring theorem): for `G : Graph α β` with
  `[Fintype G.vertexSet] [Fintype G.edgeSet]`, `IsBipartition G L R` and `k : ℕ`, there is
  `c : G.edgeSet → Fin k` with `c e ≠ c f` for distinct edges `e, f` incident with a common vertex
  if and only if every `G.incidenceCount v ≤ k`. Used in 1.2 with `k = m`.

### From TauCetiRoadmap.ComparisonSortingAndSelection

- §4.1 `Network`, `comparator`, `Network.apply`, `Network.Sorts`, copied verbatim.
- §4.2 `Network.sorts_of_sorts_bool`: a network that sorts `Bool` sorts every linear order. Used in
  3.1 with `β = ℕ`.

## References

- E. Lehman, F. T. Leighton, A. R. Meyer, *Mathematics for Computer Science*, MIT, revised
  2018-06-06 (open text), §11.3.2 pp. 486–488, Theorem 11.3.2 p. 490, Lemma 11.3.3 p. 492.
- P. Giaccone, *Multistage switching fabrics*, lecture notes, Politecnico di Torino, September 2021
  (open PDF), slides 7, 22, 24, 26, 36, 38.
- A. Waksman, *A permutation network*, J. ACM 15 (1968), no. 1, 159–163 (abstract).
- V. E. Beneš, *Optimal rearrangeable multistage connecting networks*, Bell System Technical
  Journal 43 (1964), no. 4, 1641–1656.
- C. Clos, *A study of non-blocking switching networks*, Bell System Technical Journal 32 (1953),
  no. 2, 406–424.
- OpenAI, *The matrix multiplication exponent is nine fourths*, preprint, November 2026, repository
  `openai/math` (context only).
