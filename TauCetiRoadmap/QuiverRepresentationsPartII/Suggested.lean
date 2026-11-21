import Mathlib
import TauCeti.LinearAlgebra.Graded.LinearMap

/-!
# Quiver representations, part II: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs: the internal grading, uniform pair
nilpotence, reconstruction from actual images, opposite-centralizer extension,
affine-coordinate irreducibility, finite-poset and occurrence Dilworth and cut width,
path bounds and attainment, and truncation and nonempty maximal-peeling identities.
Only simple definitions needed by these statements are included.

The finite-window classification needs the oriented-window adapter and standard
interval-pair construction. Generic duality and its
involutivity need the rank-selected generic interval type and algebraic orbit
conormal carriers. Admissible-image genericity, ram/truncation commutation,
the adjacent generic-rank formula, and ramified maximal-split additivity need
that generic-type construction and graded actual-image pairs. The representation
comparison needs the supplier's smooth GL representations, normalized induction,
and segment classification carriers. These headline theorems are not statable
at the pins with the simple definitions retained here; no substitute is stated.
-/

noncomputable section
attribute [local instance] Classical.propDecidable
open scoped BigOperators

namespace TauCetiRoadmap.QuiverRepresentationsPartII

/-! ## Layer 0: integer multisegments and maximal peeling -/

/-- The native nonempty closed interval carrier, specialized to integer endpoints. -/
abbrev Interval := NonemptyInterval ℤ

/-- Right shortening deletes a singleton rather than retaining an empty interval. -/
def Interval.shorten (s : Interval) : Option Interval :=
  if h : s.fst < s.snd then some ⟨(s.fst, s.snd - 1), by omega⟩ else none

/-- A finite multiset of intervals; equal intervals remain different occurrences. -/
abbrev Multisegment := Multiset Interval

/-- Shorten every occurrence and delete exactly the singleton occurrences. -/
def rightTruncate (m : Multisegment) : Multisegment :=
  m.bind fun s => match Interval.shorten s with
    | none => 0
    | some t => {t}

/-- Occurrence labels obtained from one representative list of the multiset. -/
def occurrenceInterval (m : Multisegment) (i : Fin m.card) : Interval :=
  m.toList[i.val]'(by simp)

/-- One copy of each distinct inclusion-maximal interval. -/
def maximalPart (m : Multisegment) : Multisegment :=
  (m.toFinset.filter fun s => ∀ t ∈ m.toFinset, s ≤ t → s = t).val

/-- Subtract the one-copy maximal part, retaining every other occurrence. -/
def remainder (m : Multisegment) : Multisegment :=
  m - maximalPart m

/-! ## Layer 1: graded operators, shifts, and actual images -/

/-- A finite coordinate space with an arbitrary integer degree at every basis index. -/
structure Space where
  n : ℕ
  degree : Fin n → ℤ

/-- The complex coordinate vector space of a graded presentation. -/
abbrev Space.Carrier (S : Space) := Fin S.n → ℂ

/-- The submodule of vectors supported on basis indices of degree a. -/
def Space.grade (S : Space) (a : ℤ) : Submodule ℂ S.Carrier where
  carrier := {v | ∀ i, S.degree i ≠ a → v i = 0}
  zero_mem' := by simp
  add_mem' := by intro x y hx hy i hi; simp [hx i hi, hy i hi]
  smul_mem' := by intro c v hv i hi; simp [hv i hi]

/-- The two allowed nonzero degree steps. -/
inductive Direction | up | down deriving DecidableEq

/-- The integer degree change of an up or down operator. -/
def Direction.step : Direction → ℤ
  | .up => 1
  | .down => -1

/-- Tau Ceti homogeneity specialized to the coordinate grading. -/
abbrev Homogeneous (S : Space) (T : Module.End ℂ S.Carrier) (c : ℤ) : Prop :=
  TauCeti.LinearMap.IsHomogeneous T S.grade S.grade c

/-- A VN or WL pair with an actual endomorphism and its degree condition. -/
structure Pair (S : Space) (d : Direction) where
  operator : Module.End ℂ S.Carrier
  homogeneous : Homogeneous S operator d.step

/-- The grading is an internal direct sum, including the zero presentation. -/
theorem Space.internal (S : Space) : DirectSum.IsInternal S.grade := by sorry

/-- Every up or down pair is nilpotent because the grading has finite support. -/
theorem Pair.nilpotent {S : Space} {d : Direction} (P : Pair S d) :
    ∃ k : ℕ, P.operator ^ k = 0 := by sorry

/-- Equal graded dimensions and isomorphic unshifted VN images determine a VN pair
(AKY Lemma 3.1, pp.14–15). -/
theorem reconstruction_from_image {S T : Space}
    (P : Pair S .up) (Q : Pair T .up)
    (hdim : ∀ a : ℤ, Module.finrank ℂ (S.grade a) =
      Module.finrank ℂ (T.grade a))
    (e : LinearMap.range P.operator ≃ₗ[ℂ] LinearMap.range Q.operator)
    (hgrade : ∀ (a : ℤ) (v : LinearMap.range P.operator),
      (v : S.Carrier) ∈ S.grade a ↔ (e v : T.Carrier) ∈ T.grade a)
    (hoperator : ∀ v : LinearMap.range P.operator,
      e (P.operator.rangeRestrict (v : S.Carrier)) =
        Q.operator.rangeRestrict (e v : T.Carrier)) :
    ∃ f : S.Carrier ≃ₗ[ℂ] T.Carrier,
      (∀ (a : ℤ) (v : S.Carrier), v ∈ S.grade a ↔ f v ∈ T.grade a) ∧
      (∀ v : S.Carrier, f (P.operator v) = Q.operator (f v)) := by sorry

/-! ## Layer 2: centralizers and generic multisegment duality -/

/-- Every opposite-degree commuting map on an actual VN or WL image extends
to an opposite-degree commuting endomorphism (AKY Lemma 3.2, p.16). -/
theorem centralizer_image_extension {S : Space} {d : Direction}
    (P : Pair S d) (L' : Module.End ℂ (LinearMap.range P.operator))
    (hgrade : ∀ (a : ℤ) (v : LinearMap.range P.operator),
      (v : S.Carrier) ∈ S.grade a →
        (L' v : S.Carrier) ∈ S.grade (a - d.step))
    (hcomm : ∀ v : LinearMap.range P.operator,
      L' (P.operator.rangeRestrict (v : S.Carrier)) =
        P.operator.rangeRestrict (L' v : S.Carrier)) :
    ∃ L : Module.End ℂ S.Carrier,
      Homogeneous S L (-d.step) ∧
      L.comp P.operator = P.operator.comp L ∧
      ∀ v : LinearMap.range P.operator,
        L (v : S.Carrier) = (L' v : S.Carrier) := by sorry

/-- Polynomial nonvanishing sets generate the complex-point Zariski topology. -/
@[instance_reducible] def polynomialTopology (n : ℕ) : TopologicalSpace (Fin n → ℂ) :=
  TopologicalSpace.generateFrom {U | ∃ p : MvPolynomial (Fin n) ℂ,
    U = {x | MvPolynomial.eval x p ≠ 0}}

/-- Finite complex affine coordinate space is irreducible for its polynomial topology. -/
theorem polynomial_irreducible (n : ℕ) :
    @IsIrreducible _ (polynomialTopology n) Set.univ := by sorry

/-! ## Layer 4: weighted chains and adjacent generic ranks -/

/-- Retain all occurrences meeting at least one of the two adjacent grades. -/
def cutPart (m : Multisegment) (a : ℤ) : Multisegment :=
  m.filter fun s => a ∈ s ∨ a + 1 ∈ s

/-- A finite set of distinct intervals is pairwise comparable by inclusion. -/
def IsInclusionChain (A : Finset Interval) : Prop :=
  IsChain (· ≤ ·) (A : Set Interval)

/-- Maximum inclusion-chain weight, counting all copies at the adjacent cut. -/
def chainWeight (m : Multisegment) (a : ℤ) : ℕ :=
  (((cutPart m a).toFinset.powerset.filter IsInclusionChain).sup
    fun A => ∑ s ∈ A, (cutPart m a).count s)

/-- Both endpoints must strictly increase; duplicate occurrences are incomparable. -/
def endpointBefore (m : Multisegment) (i j : Fin m.card) : Prop :=
  (occurrenceInterval m i).fst < (occurrenceInterval m j).fst ∧
    (occurrenceInterval m i).snd < (occurrenceInterval m j).snd

/-- An antichain has no strict endpoint-order edge between any of its labels. -/
def IsEndpointAntichain (m : Multisegment) (A : Finset (Fin m.card)) : Prop :=
  IsAntichain (endpointBefore m) (A : Set (Fin m.card))

/-- A split-graph matching has endpoint edges and injective projections in both roles. -/
def IsEndpointMatching (m : Multisegment) (E : Finset (Fin m.card × Fin m.card)) : Prop :=
  (∀ e ∈ E, endpointBefore m e.1 e.2) ∧
    (∀ e ∈ E, ∀ f ∈ E, e.1 = f.1 → e = f) ∧
    (∀ e ∈ E, ∀ f ∈ E, e.2 = f.2 → e = f)

/-- Maximum number of edges in an occurrence endpoint matching. -/
def matchingNumber (m : Multisegment) : ℕ :=
  ((Finset.univ : Finset (Fin m.card × Fin m.card)).powerset.filter
    (IsEndpointMatching m)).sup Finset.card

/-- Maximum number of labels in an occurrence endpoint antichain. -/
def antichainWidth (m : Multisegment) : ℕ :=
  ((Finset.univ : Finset (Fin m.card)).powerset.filter
    (IsEndpointAntichain m)).sup Finset.card

/-- Every finite poset has a partition into nonempty chains with as many parts as
an antichain (DIL Theorem 3, pp.6-1–6-2); the empty poset has the empty partition. -/
theorem finite_dilworth {α : Type*} [PartialOrder α] [Fintype α]
    [DecidableEq α] :
    ∃ (A : Finset α) (C : Finset (Finset α)),
      IsAntichain (· ≤ ·) (A : Set α) ∧
      (∀ c ∈ C, c.Nonempty ∧ IsChain (· ≤ ·) (c : Set α)) ∧
      (C : Set (Finset α)).Pairwise Disjoint ∧
      C.biUnion id = Finset.univ ∧ A.card = C.card := by sorry

/-- Finite Dilworth expressed through occurrence split-graph matching. -/
theorem weighted_dilworth (m : Multisegment) :
    matchingNumber m + antichainWidth m = m.card := by sorry

/-- At an adjacent cut, endpoint antichains are full weighted inclusion chains. -/
theorem cut_antichain_width (m : Multisegment) (a : ℤ) :
    antichainWidth (cutPart m a) = chainWeight m a := by sorry

/-- A monotone r-step path from the invalid initial vertex to the terminal vertex. -/
structure GridPath (r a : ℕ) where
  vertex : Fin (r + 1) → ℤ × ℤ
  start : vertex 0 = ((a : ℤ) + 1, (a : ℤ))
  finish : vertex (Fin.last r) = (1, (r : ℤ))
  steps : ∀ k : Fin r,
    vertex k.succ = ((vertex k.castSucc).1 - 1, (vertex k.castSucc).2) ∨
    vertex k.succ = ((vertex k.castSucc).1, (vertex k.castSucc).2 + 1)

/-- An invalid endpoint pair has weight zero; a valid pair has its full multiplicity. -/
def intervalWeight (m : Multisegment) (i j : ℤ) : ℕ :=
  if h : i ≤ j then m.count ⟨(i, j), h⟩ else 0

/-- Sum the multiplicity weights over every vertex of the path. -/
def GridPath.weight {r a : ℕ} (p : GridPath r a) (m : Multisegment) : ℕ :=
  ∑ k : Fin (r + 1), intervalWeight m (p.vertex k).1 (p.vertex k).2

/-- Every occurrence lies in the finite interval `[1,r]`. -/
def InWindow (m : Multisegment) (r : ℕ) : Prop :=
  ∀ s ∈ m, 1 ≤ s.fst ∧ s.snd ≤ r

/-- Every monotone grid path has weight at most the adjacent inclusion-chain maximum,
without a support-window or interior-cut hypothesis. -/
theorem GridPath.weight_bound {r a : ℕ} (p : GridPath r a) (m : Multisegment) :
    p.weight m ≤ chainWeight m a := by sorry

/-- For every cut with a ≤ r, some path realizes the weighted chain maximum;
paths and chains need not be bijective. -/
theorem grid_path_chain_max (m : Multisegment) {r a : ℕ}
    (har : a ≤ r) (hm : InWindow m r) :
    ∃ p : GridPath r a, p.weight m = chainWeight m a := by sorry

/-! ## Layer 5: the canonical ramified split and representation interfaces -/

/-- Truncation preserves the distinct one-copy maximal part. -/
theorem truncate_maximalPart (m : Multisegment) :
    maximalPart (rightTruncate m) = rightTruncate (maximalPart m) := by sorry

/-- Truncation preserves the multiplicity-sensitive remainder. -/
theorem truncate_remainder (m : Multisegment) :
    remainder (rightTruncate m) = rightTruncate (remainder m) := by sorry

/-- A nonempty cut loses precisely one unit of chain weight under maximal peeling. -/
theorem chainWeight_peeling (m : Multisegment) (a : ℤ) (h : cutPart m a ≠ 0) :
    chainWeight m a = chainWeight (remainder m) a + 1 ∧
      chainWeight (maximalPart m) a = 1 := by sorry

end TauCetiRoadmap.QuiverRepresentationsPartII
