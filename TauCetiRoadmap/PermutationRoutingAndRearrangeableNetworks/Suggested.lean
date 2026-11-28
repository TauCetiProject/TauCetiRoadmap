import Mathlib

/-!
# Permutation routing and rearrangeable networks: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

A permutation `π` of the wires is read as a map: the signal entering on wire `i` leaves on wire
`π i`, and `Equiv.trans` composes in signal order. A setting of two-by-two switches is a family of
booleans, `true` meaning that the switch exchanges its two wires. The comparator networks of
Layer 3 are copied verbatim from ComparisonSortingAndSelection §4.1.
-/

namespace TauCetiRoadmap.PermutationRoutingAndRearrangeableNetworks

open Equiv

/-! ## Layer 1: three-stage Clos networks -/

/-- 1.1 A routed state of the symmetric three-stage Clos network with `r` input switches and `r`
output switches of `n` ports each and `m` middle switches, numbered `0, …, m - 1`. The busy input
ports form `A`; the port `z ∈ A` is connected to the output port `τ z` through the middle switch
`c z < m`. The state is routed when distinct busy inputs go to distinct outputs and two
connections that share an input switch or an output switch use distinct middle switches. Values
of `τ` and `c` off `A` play no role. -/
def IsRoutedState {r n : ℕ} (m : ℕ) (A : Finset (Fin r × Fin n))
    (τ : Fin r × Fin n → Fin r × Fin n) (c : Fin r × Fin n → ℕ) : Prop :=
  Set.InjOn τ A ∧ (∀ z ∈ A, c z < m) ∧
    ∀ z ∈ A, ∀ z' ∈ A, z ≠ z' → (z.1 = z'.1 ∨ (τ z).1 = (τ z').1) → c z ≠ c z'

/-- 1.1 The Clos network is strict-sense nonblocking when, in every routed state, every idle
input port can be connected to every idle output port through some middle switch without moving
any existing connection. -/
def StrictSenseNonblocking (r n m : ℕ) : Prop :=
  ∀ (A : Finset (Fin r × Fin n)) (τ : Fin r × Fin n → Fin r × Fin n) (c : Fin r × Fin n → ℕ),
    IsRoutedState m A τ c → ∀ x y, x ∉ A → (∀ z ∈ A, τ z ≠ y) →
      ∃ μ : ℕ, IsRoutedState m (insert x A) (Function.update τ x y) (Function.update c x μ)

/-- 1.2 The Clos network is rearrangeable when every permutation of the `r n` ports can be
routed, all ports busy at once. -/
def Rearrangeable (r n m : ℕ) : Prop :=
  ∀ σ : Perm (Fin r × Fin n), ∃ c : Fin r × Fin n → ℕ, IsRoutedState m Finset.univ (⇑σ) c

/-- 1.1 Clos's theorem: with at least two input switches, the symmetric three-stage Clos network
is strict-sense nonblocking exactly when it has at least `2n − 1` middle switches (natural-number
subtraction; for `n = 0` both sides hold). -/
theorem strictSenseNonblocking_iff (r n m : ℕ) (hr : 2 ≤ r) :
    StrictSenseNonblocking r n m ↔ 2 * n - 1 ≤ m := by
  sorry

/-- 1.2 The Slepian–Duguid theorem: the symmetric three-stage Clos network is rearrangeable
exactly when it has no input switch or at least `n` middle switches. -/
theorem rearrangeable_iff (r n m : ℕ) : Rearrangeable r n m ↔ r = 0 ∨ n ≤ m := by
  sorry

/-! ## Layer 2: Beneš networks and butterflies -/

/-- 2.1 A column of `m` two-by-two switches on the wires `Fin (m * 2)`: wire `2j + b` is port `b`
of switch `j`, and switch `j` exchanges its two ports when `s j = true`. -/
def switchCol {m : ℕ} (s : Fin m → Bool) : Perm (Fin (m * 2)) :=
  finProdFinEquiv.symm.trans
    ((Equiv.prodCongrRight fun j => if s j then Equiv.swap 0 1 else Equiv.refl (Fin 2)).trans
      finProdFinEquiv)

/-- 2.1 Two networks on `m` wires side by side: wire `2j` enters the first at its wire `j` and
leaves at wire `2 (u j)`, wire `2j + 1` enters the second and leaves at wire `2 (l j) + 1`. -/
def subnetworkPair {m : ℕ} (u l : Perm (Fin m)) : Perm (Fin (m * 2)) :=
  finProdFinEquiv.symm.trans
    ((Equiv.prodCongrLeft fun b : Fin 2 => if b = 0 then u else l).trans finProdFinEquiv)

/-- 2.1 The switch settings of the Beneš network on `2 ^ (k + 1)` wires: one switch for `k = 0`;
for `k + 1`, an input column, the settings of the two subnetworks, and an output column. -/
@[reducible] def BenesSetting : ℕ → Type
  | 0 => Bool
  | k + 1 => (Fin (2 ^ (k + 1)) → Bool) × (BenesSetting k × BenesSetting k) ×
      (Fin (2 ^ (k + 1)) → Bool)

/-- 2.1 The permutation of the `2 ^ (k + 1)` wires realized by the Beneš network under a
setting. -/
def benesPerm : (k : ℕ) → BenesSetting k → Perm (Fin (2 ^ (k + 1)))
  | 0, b => if b then Equiv.swap 0 1 else 1
  | k + 1, (sIn, (u, l), sOut) =>
      (switchCol sIn).trans
        ((subnetworkPair (benesPerm k u) (benesPerm k l)).trans (switchCol sOut))

/-- 2.1 Waksman's settings: at every level of the recursion the output switch `0` is straight. -/
def IsWaksman : (k : ℕ) → BenesSetting k → Prop
  | 0, _ => True
  | k + 1, (_, (u, l), sOut) =>
      sOut ⟨0, Nat.two_pow_pos _⟩ = false ∧ IsWaksman k u ∧ IsWaksman k l

/-- 2.1 The Beneš network on `N = 2 ^ (k + 1)` wires realizes every permutation, already with
Waksman's settings (in particular `benesPerm k` is surjective); it has `(2k + 1) 2 ^ k` switches,
and Waksman's settings leave `N log₂ N − N + 1` of them free. -/
theorem benesPerm_surjective (k : ℕ) :
    (∀ σ : Perm (Fin (2 ^ (k + 1))), ∃ s, IsWaksman k s ∧ benesPerm k s = σ) ∧
      Nat.card (BenesSetting k) = 2 ^ ((2 * k + 1) * 2 ^ k) ∧
      Nat.card {s // IsWaksman k s} = 2 ^ (k * 2 ^ (k + 1) + 1) := by
  sorry

/-- 2.2 The switch settings of the butterfly on `2 ^ (k + 1)` wires: one switch for `k = 0`; for
`k + 1`, an input column and the settings of the two half-size butterflies. -/
@[reducible] def ButterflySetting : ℕ → Type
  | 0 => Bool
  | k + 1 => (Fin (2 ^ (k + 1)) → Bool) × (ButterflySetting k × ButterflySetting k)

/-- 2.2 The permutation of the `2 ^ (k + 1)` wires realized by the butterfly under a setting. -/
def butterflyPerm : (k : ℕ) → ButterflySetting k → Perm (Fin (2 ^ (k + 1)))
  | 0, b => if b then Equiv.swap 0 1 else 1
  | k + 1, (s, (u, l)) =>
      (switchCol s).trans (subnetworkPair (butterflyPerm k u) (butterflyPerm k l))

/-- 2.2 Distinct settings of the butterfly realize distinct permutations; it has `(k + 1) 2 ^ k`
switches, and it realizes every permutation exactly when `k = 0`. -/
theorem butterflyPerm_injective (k : ℕ) :
    Function.Injective (butterflyPerm k) ∧
      Nat.card (ButterflySetting k) = 2 ^ ((k + 1) * 2 ^ k) ∧
      (Function.Surjective (butterflyPerm k) ↔ k = 0) := by
  sorry

/-! ## Layer 3: sorting networks as permutation networks -/

/-- 3.1 (copied verbatim from ComparisonSortingAndSelection §4.1) A comparator network on `n` wires:
a list of comparators, each a pair of wires. -/
abbrev Network (n : ℕ) : Type := List (Fin n × Fin n)

/-- 3.1 (copied verbatim from ComparisonSortingAndSelection §4.1) The comparator `p` puts the
smaller of the values on the wires `p.1` and `p.2` on the wire `p.1` and the larger on the wire
`p.2`. -/
def comparator {n : ℕ} {β : Type*} [LinearOrder β] (p : Fin n × Fin n) (x : Fin n → β) :
    Fin n → β :=
  fun k => if k = p.1 then min (x p.1) (x p.2) else if k = p.2 then max (x p.1) (x p.2) else x k

namespace Network

variable {n : ℕ} {β : Type*} [LinearOrder β]

/-- 3.1 (copied verbatim from ComparisonSortingAndSelection §4.1) The output of a network on the
input `x`: its comparators act in the order of the list. -/
def apply : Network n → (Fin n → β) → Fin n → β
  | [], x => x
  | p :: c, x => apply c (comparator p x)

/-- 3.1 (copied verbatim from ComparisonSortingAndSelection §4.1) A network sorts the linear order
`β` when all its outputs on inputs from `β` are monotone. -/
def Sorts (c : Network n) (β : Type*) [LinearOrder β] : Prop :=
  ∀ x : Fin n → β, Monotone (c.apply x)

/-- 3.1 A comparator network read as a network of two-by-two switches: under the setting `s`,
the comparator at position `i` of the list exchanges its two wires when `s i = true`. -/
def switchPerm : (c : Network n) → (Fin c.length → Bool) → Perm (Fin n)
  | [], _ => 1
  | p :: c, s => (if s 0 then Equiv.swap p.1 p.2 else 1).trans (switchPerm c fun i => s i.succ)

/-- 3.1 Every sorting network, read as a network of switches, realizes every permutation of its
wires. The route uses the zero–one principle, `sorts_of_sorts_bool` of ComparisonSortingAndSelection
§4.2, which is not restated here. -/
theorem switchPerm_surjective (c : Network n) (h : c.Sorts Bool) :
    Function.Surjective c.switchPerm := by
  sorry

end Network

end TauCetiRoadmap.PermutationRoutingAndRearrangeableNetworks
