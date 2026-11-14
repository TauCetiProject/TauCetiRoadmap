module

public import Mathlib

/-!
# Hecke stacks and local shtukas, Part II: target signatures

The roadmap is README.md; this file is not the roadmap. This acceptance test concerns
the roadmap's headline theorems against the pinned Mathlib and Tau Ceti APIs.

The file states one headline at the pins: the combinatorial bound on the chart index sets of
extended semi-modules and its attainment (Layer 2, §§2.2 and 2.5 of the roadmap). The
following geometric headline theorems are not statable at the pins:

* Minimal twisted-class nonemptiness and dimension, geometric Deligne–Lusztig
  reduction, and dimension equals class-polynomial degree lack the affine flag
  moduli space and its affine Deligne–Lusztig loci. The last theorem also lacks the
  integral twisted affine-Hecke cocenter and its geometric comparison.
* Extended-semi-module chart dimension and superbasic GL dimension lack the
  lattice-moduli strata and their scheme or perfect-space realizations. Their
  combinatorial core, Viehmann's bound on the chart index set of an extended
  semi-module and its attainment by the cyclic extended semi-module of
  increasing type, involves only subsets of `ℤ` and is stated below.
* Twisted Lang and Levi-retraction dimension comparison lack the admissible loop
  spaces, their normalized dimension, and the retraction strata.
* Unramified restriction of scalars versus iterated loci, and exact, bounded and
  iterated spherical dimensions, lack the torsor affine Grassmannian and its
  Frobenius-graph pullbacks as moduli spaces.
* Spherical nonemptiness in terms of integral Kottwitz and Newton invariants lacks
  those loci and the general reductive-group Kottwitz-set interface. The pinned
  Witt-vector isocrystal theory does not supply this interface.
* The virtual dimension upper bound lacks affine Deligne–Lusztig geometric loci,
  their dimension, and the normal-form and Newton-invariant interface.
* The Newton-cell/ADLV dimension comparison, the greatest generic Newton class
  and its geometric dimension, cordial interval saturation and numerical dimensions
  in either characteristic, and Newton-stratum
  closures and equidimensionality in equal characteristic, lack Newton-stratified
  Iwahori cells and their comparison with affine Deligne–Lusztig geometry.
* Translation-family generic class and cordiality require those same geometric
  carriers; a scalar equality about abstract length functions is not this result.
* The two-correspondence reduction to a cordial translation family lacks bounded
  flag-incidence moduli, their Frobenius pullbacks, and geometric fibre dimensions.
* The P-alcove Levi obstruction, the non-shrunken basic seed, and the comparison
  over all matching Levi classes lack the Levi and group affine Deligne–Lusztig
  loci and the integral map of Kottwitz sets.
* The shrunken-chamber nonemptiness and dimension theorem, its basic specialization
  without a strict Newton gap, and its large-translation specialization lack those
  loci, the affine apartment and Iwahori–Weyl interface, and compatible original-group
  Newton invariants.

The native scheme, subgroup, coset, root-pairing and isocrystal carriers do not by
themselves provide these moduli constructions. Constructing them is substantial
library work. No free predicate, assumed geometric carrier, or elementary coset
identity is substituted for a headline theorem.
-/

namespace TauCetiRoadmap.HeckeStacksAndLocalShtukasPartII

@[expose] public section

/-! ## Layer 2: superbasic lattice charts -/

/-- The residue basis `B = A ∖ (h + A)` of a subset `A ⊆ ℤ` (vie06, Definition 3.1). -/
def residueBasis (h : ℕ) (A : Set ℤ) : Set ℤ :=
  A \ (fun a => a + (h : ℤ)) '' A

/-- The largest `n ≥ 0` with `a + m - n h ∈ A`, the upper bound of vie06, Definition 3.4(3).
For a nonempty semi-module and `a ∈ A` the set is nonempty (it contains `0`) and bounded. -/
noncomputable def semiModuleJump (m h : ℕ) (A : Set ℤ) (a : ℤ) : ℕ :=
  sSup {n : ℕ | a + m - (n : ℤ) * h ∈ A}

/-- An extended semi-module for `m, h` and an `h`-tuple `μ` (vie06, Definitions 3.1 and 3.4):
a nonempty normalized semi-module `A ⊆ ℤ` (bounded below, stable under `+m` and `+h`, residue
basis of sum `h(h-1)/2`) together with `φ : ℤ → ℕ ∪ {-∞}` that is `-∞` exactly off `A`, rises by
at least one under `+h`, is bounded by `semiModuleJump` on `A` with equality on every tail
contained in `A`, and admits a decomposition of `A` into `h` sequences along which `φ` rises by
one, the successor being `a + h` exactly when `φ (a + h) = φ a + 1` and larger otherwise, with
initial values a permutation of `μ`. -/
structure ExtendedSemiModule (m h : ℕ) (μ : Fin h → ℕ) where
  /-- The underlying semi-module. -/
  A : Set ℤ
  nonempty : A.Nonempty
  bddBelow : BddBelow A
  add_m_mem : ∀ a ∈ A, a + (m : ℤ) ∈ A
  add_h_mem : ∀ a ∈ A, a + (h : ℤ) ∈ A
  /-- Normalization: the residue basis has sum `h(h-1)/2`. -/
  normalized : 2 * ∑ᶠ a ∈ residueBasis h A, a = (h : ℤ) * ((h : ℤ) - 1)
  /-- The function `φ`, with `⊥` standing for `-∞`. -/
  φ : ℤ → WithBot ℕ
  φ_eq_bot_iff : ∀ a, φ a = ⊥ ↔ a ∉ A
  φ_add_h : ∀ a, φ a + 1 ≤ φ (a + (h : ℤ))
  φ_le_jump : ∀ a ∈ A, φ a ≤ (semiModuleJump m h A a : WithBot ℕ)
  φ_eq_jump : ∀ a, Set.Ici a ⊆ A → φ a = (semiModuleJump m h A a : WithBot ℕ)
  /-- The decomposition of `A` into `h` sequences. -/
  seq : Fin h → ℕ → ℤ
  seq_injective : Function.Injective fun p : Fin h × ℕ => seq p.1 p.2
  range_seq : Set.range (fun p : Fin h × ℕ => seq p.1 p.2) = A
  φ_seq_succ : ∀ l j, φ (seq l (j + 1)) = φ (seq l j) + 1
  seq_succ_eq : ∀ l j, φ (seq l j + (h : ℤ)) = φ (seq l j) + 1 → seq l (j + 1) = seq l j + h
  seq_succ_gt : ∀ l j, φ (seq l j + (h : ℤ)) ≠ φ (seq l j) + 1 → seq l j + h < seq l (j + 1)
  /-- The initial values of the sequences are a permutation of `μ`. -/
  initial_perm : ∃ e : Equiv.Perm (Fin h), ∀ l, φ (seq l 0) = (μ (e l) : WithBot ℕ)

namespace ExtendedSemiModule

variable {m h : ℕ} {μ : Fin h → ℕ}

/-- The chart index set `V(A,φ) = {(a,b) ∈ A × A : a < b, φ b < φ a, φ (a - h) < φ b}`
(vie06, (4.1)); its cardinality is the dimension of the lattice stratum `S_(A,φ)`. -/
def chartIndices (E : ExtendedSemiModule m h μ) : Set (ℤ × ℤ) :=
  {p | p.1 ∈ E.A ∧ p.2 ∈ E.A ∧ p.1 < p.2 ∧ E.φ p.2 < E.φ p.1 ∧ E.φ (p.1 - h) < E.φ p.2}

/-- An extended semi-module is cyclic when `φ` equals `semiModuleJump` on all of `A`
(vie06, after Definition 3.4). -/
def IsCyclic (E : ExtendedSemiModule m h μ) : Prop :=
  ∀ a ∈ E.A, E.φ a = (semiModuleJump m h E.A a : WithBot ℕ)

/-- Viehmann's combinatorial bound: for coprime `m, h ≥ 1` and an increasing `μ` of sum `m`,
every extended semi-module for `μ` has a finite chart index set `V` with
`2 |V| ≤ Σᵢ (2i + 1 - h) μᵢ - (h - 1)`, that is `|V| ≤ ⟨ρ, μ - ν⟩ - (h - 1)/2` in the increasing
convention (vie06, Theorem 5.3, PDF pp. 9–12). -/
theorem chartIndices_bound (hm : 0 < m) (hh : 0 < h) (hmh : Nat.Coprime m h)
    (hμ : Monotone μ) (hsum : ∑ i, μ i = m) (E : ExtendedSemiModule m h μ) :
    E.chartIndices.Finite ∧
      2 * (E.chartIndices.ncard : ℤ) ≤
        ∑ i : Fin h, (2 * (i : ℤ) + 1 - h) * (μ i : ℤ) - ((h : ℤ) - 1) := by
  sorry

/-- Sharpness of the bound: for coprime `m, h ≥ 1` and an increasing `μ` of sum `m`, the cyclic
extended semi-module attached to the normalized semi-module of type `μ` attains it
(vie06, Lemma 3.3 and Proposition 5.2, PDF pp. 3 and 8–9). -/
theorem exists_isCyclic_chartIndices_eq (hm : 0 < m) (hh : 0 < h) (hmh : Nat.Coprime m h)
    (hμ : Monotone μ) (hsum : ∑ i, μ i = m) :
    ∃ E : ExtendedSemiModule m h μ, E.IsCyclic ∧ E.chartIndices.Finite ∧
      2 * (E.chartIndices.ncard : ℤ) =
        ∑ i : Fin h, (2 * (i : ℤ) + 1 - h) * (μ i : ℤ) - ((h : ℤ) - 1) := by
  sorry

end ExtendedSemiModule

end

end TauCetiRoadmap.HeckeStacksAndLocalShtukasPartII
