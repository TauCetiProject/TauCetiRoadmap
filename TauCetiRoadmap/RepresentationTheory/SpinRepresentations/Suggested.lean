import Mathlib
import TauCeti.LinearAlgebra.CliffordAlgebra.Filtration
import TauCeti.LinearAlgebra.CliffordAlgebra.RealForm.Basic
import TauCeti.LinearAlgebra.CliffordAlgebra.Quadratic.Lie.LeftRegular
import TauCeti.RepresentationTheory.Spin.HalfSpin.Basic
import TauCeti.RepresentationTheory.Spin.Polarization.TypeD.HighestWeight
import TauCeti.Algebra.Lie.HighestWeight.Verma
import TauCeti.LinearAlgebra.RootSystem.Weyl.Vector
import TauCeti.Algebra.Lie.D4.Tripled.Triality
import TauCeti.Topology.Algebra.CliffordAlgebra.Spin.Connected

/-!
# Clifford algebras, the Pin and Spin groups, and spin representations: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the single
definition (`kostantSpinRep`) one of them needs to be stated. Everything the pinned libraries
already prove (the structure theorem, the double covers, the Fock module and its irreducibility,
`Spin₃ ≅ SL₂`, `Spin₄ ≅ SL₂ × SL₂`, Bott periodicity, the `gl_N` CAR decomposition) is consumed
by name in `README.md` and is not restated here.

Headline theorems not statable at the pins, and what each lacks:

* the type-`Bₗ` identification `S ≅ L(ωₗ)` (Layer 5): `LieAlgebra.Orthogonal.typeB` has no
  Killing-form instance, no Cartan subalgebra with a basis and no base of a root system at the
  pin, so the fundamental weight `ωₗ` has no carrier;
* the type-`Dₗ` identifications in half-rank `2` and `3` (Layer 5): the split Cartan basis
  `TauCeti.TypeDStd.lieBasis n hn` and the instance `TauCeti.TypeDStd.isKilling_typeD` need
  `4 ≤ n`;
* the group-level highest-weight corollary and the differential comparison (Layers 3 and 5): no
  smooth-group carrier for `spinGroup Q` identifies the differential of `TauCeti.spinRep` with a
  Lie-algebra action;
* the octonion comparison of the triality form (Layer 8): Mathlib has no octonion algebra;
* Kostant's full `ρ`-decomposition `C(𝔤) ≅ End(V_ρ) ⊗ C(P)` (Layer 9): the primitive subspace
  `P` and its quadratic form `Q_P` are constructions of the roadmap.
-/

namespace TauCetiRoadmap.RepresentationTheory.SpinRepresentations

open CliffordAlgebra
open scoped DirectSum

-- The commutator Lie structure on associative algebras, needed for `AlgHom.toLieHom` on
-- `Module.End` and on the Clifford algebra below.
attribute [local instance 100] LieRing.ofAssociativeRing

universe u v

/-! ## Layer 0: the Clifford algebra, its universal property, and the two gradings -/

/-- **Isometries from Clifford automorphisms.** Over a field `K` with `2` invertible and a
finite-dimensional `V`, for every quadratic form `Q` on `V` (degenerate forms included), an
algebra automorphism `φ` of `CliffordAlgebra Q` maps the vector subspace `range (ι Q)` onto
itself if and only if it is `CliffordAlgebra.equivOfIsometry f` for a unique self-isometry `f`
of `Q`. The isometry is read off on generators through `CliffordAlgebra.ιRangeEquiv`, and the
generator square `ι v * ι v = Q v` forces it to preserve `Q`. -/
theorem generator_range_iff {K : Type u} {V : Type v} [Field K] [Invertible (2 : K)]
    [AddCommGroup V] [Module K V] [FiniteDimensional K V] (Q : QuadraticForm K V)
    (φ : CliffordAlgebra Q ≃ₐ[K] CliffordAlgebra Q) :
    Submodule.map φ.toLinearMap (LinearMap.range (CliffordAlgebra.ι Q)) =
        LinearMap.range (CliffordAlgebra.ι Q) ↔
      ∃! f : Q.IsometryEquiv Q, CliffordAlgebra.equivOfIsometry f = φ := sorry

/-- **The first word-filtration step suffices.** Preserving `F₁ = K · 1 ⊕ range (ι Q)`, the
native `CliffordAlgebra.filtration Q 1`, is equivalent to preserving the vector subspace: writing
`φ (ι v) = a v • 1 + ι (T v)`, the degree-one part of the generator square is `2 a v • ι (T v)`,
so `a = 0` because `T` is invertible on `F₁ / F₀`. Preserving only the `ℤ/2`-grading is a
different, weaker condition. -/
theorem first_word_piece_iff {K : Type u} {V : Type v} [Field K] [Invertible (2 : K)]
    [AddCommGroup V] [Module K V] [FiniteDimensional K V] (Q : QuadraticForm K V)
    (φ : CliffordAlgebra Q ≃ₐ[K] CliffordAlgebra Q) :
    Submodule.map φ.toLinearMap (CliffordAlgebra.filtration Q 1) =
        CliffordAlgebra.filtration Q 1 ↔
      Submodule.map φ.toLinearMap (LinearMap.range (CliffordAlgebra.ι Q)) =
        LinearMap.range (CliffordAlgebra.ι Q) := sorry

/-! ## Layer 2: the Pin and Spin groups and the double covers -/

/-- **Compact `Spin(n)` is simply connected for `n ≥ 3`.** The carrier is the native
`CliffordAlgebra.realCliffordSpinGroupZero n = spinGroup (TauCeti.realCliffordForm n 0)` with its
subspace topology from the Clifford units. The offset is exact: `Spin(2) ≅ S¹` has fundamental
group `ℤ`, and `Spin(1) = {±1}` is not path connected. The route is the fibre sequence
`Spin(m) → Spin(m + 1) → S^m` and the simple connectivity of `S^m` for `m ≥ 2`, seeded by the
native `Spin(3) ≅ S³` (Lawson–Michelsohn, *Spin Geometry*, Theorem I.2.10). -/
theorem simplyConnectedSpace_realCliffordSpinGroupZero_add_three (n : ℕ) :
    SimplyConnectedSpace (CliffordAlgebra.realCliffordSpinGroupZero (n + 3)) := sorry

/-! ## Layer 5: the fundamental representations of `Bₗ` and `Dₗ`

The four statements identify the native half-spin modules, made modules over the split
`𝔰𝔬(2n) = LieAlgebra.Orthogonal.typeD (Fin n) ℂ` through the native coordinate realizations
`P.typeDSpinPlusLieRep b hline` and `P.typeDSpinMinusLieRep b hline`, with the irreducible
highest-weight modules `TauCeti.irreducibleQuotient base ω` of the fork weights. Here `base` is
the base of the native split Cartan basis `TauCeti.TypeDStd.lieBasis n hn`, and the fundamental
weights are the dual basis of its simple coroots: `ωₙ` is the dual-basis vector at index `n - 1`
and `ωₙ₋₁` the one at index `n - 2`. The parity rule is forced by the degree of the top wedge:
`w₁ ∧ ⋯ ∧ wₙ` has weight `ωₙ` and lies in `S⁺` for even `n`, in `S⁻` for odd `n`; erasing the
last basis vector gives weight `ωₙ₋₁` on the other summand (Fulton–Harris, *Representation
Theory*, Lecture 20, §20.1). The native lemmas
`TauCeti.SpinPolarizationData.isHighestWeightVector_typeDSpin{Plus,Minus}LieRep_exteriorBasis_…`
supply the highest-weight vectors; the headlines add the isomorphism of modules. -/

/-- **`S⁺ ≅ L(ωₙ)` for even `n ≥ 4`.** -/
theorem spinPlus_equiv_irreducibleQuotient_of_even {n : ℕ} {V : Type v} [AddCommGroup V]
    [Module ℂ V] {Q : QuadraticForm ℂ V} (P : TauCeti.SpinPolarizationData Q)
    (b : Module.Basis (Fin n) ℂ P.W) (hn : 4 ≤ n) (hline : P.line = ⊥) (heven : Even n) :
    letI := TauCeti.TypeDStd.isKilling_typeD (K := ℂ) n hn
    letI := (TauCeti.TypeDStd.lieBasis (K := ℂ) n hn).isCartanSubalgebra
    letI := (TauCeti.TypeDStd.lieBasis (K := ℂ) n hn).isTriangularizable
    letI : LieRingModule (LieAlgebra.Orthogonal.typeD (Fin n) ℂ) (TauCeti.spinPlus Q P) :=
      LieRingModule.compLieHom _ (P.typeDSpinPlusLieRep b hline)
    letI : LieModule ℂ (LieAlgebra.Orthogonal.typeD (Fin n) ℂ) (TauCeti.spinPlus Q P) :=
      LieModule.compLieHom _ (P.typeDSpinPlusLieRep b hline)
    Nonempty (TauCeti.spinPlus Q P ≃ₗ⁅ℂ, LieAlgebra.Orthogonal.typeD (Fin n) ℂ⁆
      TauCeti.irreducibleQuotient (TauCeti.TypeDStd.lieBasis (K := ℂ) n hn).base
        ((TauCeti.TypeDStd.lieBasis (K := ℂ) n hn).cartanBasis.dualBasis
          (⟨n - 1, by omega⟩ : Fin n))) := sorry

/-- **`S⁻ ≅ L(ωₙ)` for odd `n ≥ 4`.** -/
theorem spinMinus_equiv_irreducibleQuotient_of_odd {n : ℕ} {V : Type v} [AddCommGroup V]
    [Module ℂ V] {Q : QuadraticForm ℂ V} (P : TauCeti.SpinPolarizationData Q)
    (b : Module.Basis (Fin n) ℂ P.W) (hn : 4 ≤ n) (hline : P.line = ⊥) (hodd : Odd n) :
    letI := TauCeti.TypeDStd.isKilling_typeD (K := ℂ) n hn
    letI := (TauCeti.TypeDStd.lieBasis (K := ℂ) n hn).isCartanSubalgebra
    letI := (TauCeti.TypeDStd.lieBasis (K := ℂ) n hn).isTriangularizable
    letI : LieRingModule (LieAlgebra.Orthogonal.typeD (Fin n) ℂ) (TauCeti.spinMinus Q P) :=
      LieRingModule.compLieHom _ (P.typeDSpinMinusLieRep b hline)
    letI : LieModule ℂ (LieAlgebra.Orthogonal.typeD (Fin n) ℂ) (TauCeti.spinMinus Q P) :=
      LieModule.compLieHom _ (P.typeDSpinMinusLieRep b hline)
    Nonempty (TauCeti.spinMinus Q P ≃ₗ⁅ℂ, LieAlgebra.Orthogonal.typeD (Fin n) ℂ⁆
      TauCeti.irreducibleQuotient (TauCeti.TypeDStd.lieBasis (K := ℂ) n hn).base
        ((TauCeti.TypeDStd.lieBasis (K := ℂ) n hn).cartanBasis.dualBasis
          (⟨n - 1, by omega⟩ : Fin n))) := sorry

/-- **`S⁺ ≅ L(ωₙ₋₁)` for odd `n ≥ 4`.** -/
theorem spinPlus_equiv_irreducibleQuotient_of_odd {n : ℕ} {V : Type v} [AddCommGroup V]
    [Module ℂ V] {Q : QuadraticForm ℂ V} (P : TauCeti.SpinPolarizationData Q)
    (b : Module.Basis (Fin n) ℂ P.W) (hn : 4 ≤ n) (hline : P.line = ⊥) (hodd : Odd n) :
    letI := TauCeti.TypeDStd.isKilling_typeD (K := ℂ) n hn
    letI := (TauCeti.TypeDStd.lieBasis (K := ℂ) n hn).isCartanSubalgebra
    letI := (TauCeti.TypeDStd.lieBasis (K := ℂ) n hn).isTriangularizable
    letI : LieRingModule (LieAlgebra.Orthogonal.typeD (Fin n) ℂ) (TauCeti.spinPlus Q P) :=
      LieRingModule.compLieHom _ (P.typeDSpinPlusLieRep b hline)
    letI : LieModule ℂ (LieAlgebra.Orthogonal.typeD (Fin n) ℂ) (TauCeti.spinPlus Q P) :=
      LieModule.compLieHom _ (P.typeDSpinPlusLieRep b hline)
    Nonempty (TauCeti.spinPlus Q P ≃ₗ⁅ℂ, LieAlgebra.Orthogonal.typeD (Fin n) ℂ⁆
      TauCeti.irreducibleQuotient (TauCeti.TypeDStd.lieBasis (K := ℂ) n hn).base
        ((TauCeti.TypeDStd.lieBasis (K := ℂ) n hn).cartanBasis.dualBasis
          (⟨n - 2, by omega⟩ : Fin n))) := sorry

/-- **`S⁻ ≅ L(ωₙ₋₁)` for even `n ≥ 4`.** -/
theorem spinMinus_equiv_irreducibleQuotient_of_even {n : ℕ} {V : Type v} [AddCommGroup V]
    [Module ℂ V] {Q : QuadraticForm ℂ V} (P : TauCeti.SpinPolarizationData Q)
    (b : Module.Basis (Fin n) ℂ P.W) (hn : 4 ≤ n) (hline : P.line = ⊥) (heven : Even n) :
    letI := TauCeti.TypeDStd.isKilling_typeD (K := ℂ) n hn
    letI := (TauCeti.TypeDStd.lieBasis (K := ℂ) n hn).isCartanSubalgebra
    letI := (TauCeti.TypeDStd.lieBasis (K := ℂ) n hn).isTriangularizable
    letI : LieRingModule (LieAlgebra.Orthogonal.typeD (Fin n) ℂ) (TauCeti.spinMinus Q P) :=
      LieRingModule.compLieHom _ (P.typeDSpinMinusLieRep b hline)
    letI : LieModule ℂ (LieAlgebra.Orthogonal.typeD (Fin n) ℂ) (TauCeti.spinMinus Q P) :=
      LieModule.compLieHom _ (P.typeDSpinMinusLieRep b hline)
    Nonempty (TauCeti.spinMinus Q P ≃ₗ⁅ℂ, LieAlgebra.Orthogonal.typeD (Fin n) ℂ⁆
      TauCeti.irreducibleQuotient (TauCeti.TypeDStd.lieBasis (K := ℂ) n hn).base
        ((TauCeti.TypeDStd.lieBasis (K := ℂ) n hn).cartanBasis.dualBasis
          (⟨n - 2, by omega⟩ : Fin n))) := sorry

/-! ## Layer 6: the low-dimensional exceptional isomorphisms

`Spin₃ ≅ SL₂` and `Spin₄ ≅ SL₂ × SL₂` are native
(`TauCeti.nonempty_spinGroup_mulEquiv_specialLinearGroup_of_finrank_eq_three`,
`TauCeti.nonempty_spinGroup_mulEquiv_specialLinearGroup_prod_of_finrank_eq_four`), and
`Spin₅ ≅ Sp₄` is the split case of the general-field statement `Spin(Q) = Sp(C₀, σ)` of
OrthogonalSpinGroups Layer 1F, with the native `range_spinGroup_toUnits_eq_evenUnitaryGroup`
in dimension five; only the identification of the spin module with the standard representation
is this roadmap's, and it is a README target. -/

/-- **`Spin₆ ≅ SL₄`** (type `D₃ = A₃`): for every nondegenerate complex quadratic form in
dimension `6`, the native `spinGroup Q` is isomorphic to `SL₄(ℂ)`. The even Clifford algebra is
`End(S⁺) × End(S⁻) ≅ M₄(ℂ) × M₄(ℂ)`; with a reversal-compatible duality `S⁻ ≅ (S⁺)*` the
norm-one even units are the pairs `(A, (A⁻¹)ᵀ)`, a copy of `GL₄(ℂ)`, and the vector-preservation
condition of native Spin membership cuts this to `det A = 1`; the native obstruction
`CliffordAlgebra.range_spinGroup_toUnits_ne_evenUnitaryGroup_of_six_le_finrank` records that the
norm-one condition alone does not suffice (Fulton–Harris, Lecture 20, §20.2). -/
theorem spin6_equiv_sl4 {V : Type v} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]
    (Q : QuadraticForm ℂ V) (hQ : Q.Nondegenerate) (hV : Module.finrank ℂ V = 6) :
    Nonempty (spinGroup Q ≃* Matrix.SpecialLinearGroup (Fin 4) ℂ) := sorry

/-! ## Layer 7: real Clifford algebras, Bott periodicity, and `Spin(p, q)` -/

/-- **The eightfold way.** `Cliff(p, q) = CliffordAlgebra (TauCeti.realCliffordForm p q)`, with
`p` generators squaring to `+1` and `q` to `−1`, is a matrix algebra, or a product of two, over
`ℝ`, `ℂ` or `ℍ` according to `(q − p) mod 8`, with the size fixed by `dim Cliff(p, q) = 2^(p+q)`:

| `(q − p) mod 8` | `0` | `1` | `2` | `3` | `4` | `5` | `6` | `7` |
|---|---|---|---|---|---|---|---|---|
| `Cliff(p, q)` | `M(ℝ)` | `M(ℂ)` | `M(ℍ)` | `M(ℍ) × M(ℍ)` | `M(ℍ)` | `M(ℂ)` | `M(ℝ)` | `M(ℝ) × M(ℝ)` |

The indexing is the one forced by the native base entries `Cliff(1, 0) ≅ ℝ × ℝ` (residue `7`),
`Cliff(0, 1) ≅ ℂ` (residue `1`), `Cliff(0, 2) ≅ ℍ` (residue `2`) and `Cliff(1, 1) ≅ M₂(ℝ)`
(residue `0`); references whose generators square to `+1` index by `(p − q) mod 8` instead. The
residue has the parity of `p + q`, so every exponent below is an exact division and no
subtraction is truncated (Lawson–Michelsohn, *Spin Geometry*, Theorem I.4.3 and Tables I–II of
§I.4, whose `Cl(r, s)` is `Cliff(s, r)` here). The route is the native Bott recurrence
`TauCeti.realCliffordBottEquiv`, the two one-sided recurrences and the base entries. -/
theorem realClifford_eightfold (p q : ℕ) :
    (((q : ℤ) - p) % 8 = 0 → Nonempty (CliffordAlgebra (TauCeti.realCliffordForm p q) ≃ₐ[ℝ]
        Matrix (Fin (2 ^ ((p + q) / 2))) (Fin (2 ^ ((p + q) / 2))) ℝ)) ∧
    (((q : ℤ) - p) % 8 = 1 → Nonempty (CliffordAlgebra (TauCeti.realCliffordForm p q) ≃ₐ[ℝ]
        Matrix (Fin (2 ^ ((p + q - 1) / 2))) (Fin (2 ^ ((p + q - 1) / 2))) ℂ)) ∧
    (((q : ℤ) - p) % 8 = 2 → Nonempty (CliffordAlgebra (TauCeti.realCliffordForm p q) ≃ₐ[ℝ]
        Matrix (Fin (2 ^ ((p + q - 2) / 2))) (Fin (2 ^ ((p + q - 2) / 2))) (Quaternion ℝ))) ∧
    (((q : ℤ) - p) % 8 = 3 → Nonempty (CliffordAlgebra (TauCeti.realCliffordForm p q) ≃ₐ[ℝ]
        Matrix (Fin (2 ^ ((p + q - 3) / 2))) (Fin (2 ^ ((p + q - 3) / 2))) (Quaternion ℝ) ×
        Matrix (Fin (2 ^ ((p + q - 3) / 2))) (Fin (2 ^ ((p + q - 3) / 2))) (Quaternion ℝ))) ∧
    (((q : ℤ) - p) % 8 = 4 → Nonempty (CliffordAlgebra (TauCeti.realCliffordForm p q) ≃ₐ[ℝ]
        Matrix (Fin (2 ^ ((p + q - 2) / 2))) (Fin (2 ^ ((p + q - 2) / 2))) (Quaternion ℝ))) ∧
    (((q : ℤ) - p) % 8 = 5 → Nonempty (CliffordAlgebra (TauCeti.realCliffordForm p q) ≃ₐ[ℝ]
        Matrix (Fin (2 ^ ((p + q - 1) / 2))) (Fin (2 ^ ((p + q - 1) / 2))) ℂ)) ∧
    (((q : ℤ) - p) % 8 = 6 → Nonempty (CliffordAlgebra (TauCeti.realCliffordForm p q) ≃ₐ[ℝ]
        Matrix (Fin (2 ^ ((p + q) / 2))) (Fin (2 ^ ((p + q) / 2))) ℝ)) ∧
    (((q : ℤ) - p) % 8 = 7 → Nonempty (CliffordAlgebra (TauCeti.realCliffordForm p q) ≃ₐ[ℝ]
        Matrix (Fin (2 ^ ((p + q - 1) / 2))) (Fin (2 ^ ((p + q - 1) / 2))) ℝ ×
        Matrix (Fin (2 ^ ((p + q - 1) / 2))) (Fin (2 ^ ((p + q - 1) / 2))) ℝ)) := sorry

/-! ## Layer 8: triality for `Spin₈` -/

/-- **Triality for `Spin₈`, compared with the native tripled carrier.** For a nondegenerate
eight-dimensional complex quadratic space with an even polarization `P` (`P.line = ⊥`), there is
an automorphism `t` of the native `spinGroup Q` with `t³ = 1` that is not inner, whose pullbacks
cycle the vector representation (through `spinToSpecialOrthogonal`) and the two native half-spin
subrepresentations as `V ∘ t ≅ S⁺`, `S⁺ ∘ t ≅ S⁻`, `S⁻ ∘ t ≅ V`, and which corresponds to the
native triality `TauCeti.D4Tripled.trialityPoints ℂ` of the tripled type-`D₄` carrier under a
group isomorphism `TauCeti.D4Tripled.points ℂ ≃* spinGroup Q`. README Layer 8 pins that
isomorphism on the numbered root subgroups and the weight torus and fixes the orientation by the
inverse torus relabelling; reversing the diagram cycle replaces `t` by `t⁻¹` and reverses every
pullback (Fulton–Harris, Lecture 20, §20.3). -/
theorem exists_trialityAut {V : Type v} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]
    (Q : QuadraticForm ℂ V) (hQ : Q.Nondegenerate) (hV : Module.finrank ℂ V = 8)
    (P : TauCeti.SpinPolarizationData Q) (hline : P.line = ⊥) :
    ∃ t : spinGroup Q ≃* spinGroup Q,
      (∀ x, t (t (t x)) = x) ∧
      (¬ ∃ g : spinGroup Q, ∀ x, t x = g * x * g⁻¹) ∧
      (∃ K : (TauCeti.spinPlusSubrep P hline).toSubmodule ≃ₗ[ℂ] V, ∀ s v,
        (spinToSpecialOrthogonal Q (t s) : V ≃ₗ[ℂ] V) (K v) =
          K ((TauCeti.spinPlusSubrep P hline).toRepresentation s v)) ∧
      (∃ K : (TauCeti.spinMinusSubrep P hline).toSubmodule ≃ₗ[ℂ]
          (TauCeti.spinPlusSubrep P hline).toSubmodule, ∀ s v,
        (TauCeti.spinPlusSubrep P hline).toRepresentation (t s) (K v) =
          K ((TauCeti.spinMinusSubrep P hline).toRepresentation s v)) ∧
      (∃ K : V ≃ₗ[ℂ] (TauCeti.spinMinusSubrep P hline).toSubmodule, ∀ s v,
        (TauCeti.spinMinusSubrep P hline).toRepresentation (t s) (K v) =
          K ((spinToSpecialOrthogonal Q s : V ≃ₗ[ℂ] V) v)) ∧
      ∃ Ψ : TauCeti.D4Tripled.points ℂ ≃* spinGroup Q, ∀ g,
        t (Ψ g) = Ψ (TauCeti.D4Tripled.trialityPoints ℂ g) := sorry

/-- **The triality form.** In the same setting there is a nonzero trilinear form
`V ⊗ S⁺ ⊗ S⁻ → ℂ` invariant under the native `spinGroup Q`, acting on `V` through
`spinToSpecialOrthogonal` and on the half-spin summands through the native subrepresentations;
it is Clifford multiplication `V ⊗ S⁺ → S⁻` paired with the reversal-invariant pairing on `S⁻`
(Fulton–Harris, Lecture 20, §20.3). Its comparison with octonion multiplication is a README
target with no carrier at the pin. -/
theorem exists_trialityForm {V : Type v} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]
    (Q : QuadraticForm ℂ V) (hQ : Q.Nondegenerate) (hV : Module.finrank ℂ V = 8)
    (P : TauCeti.SpinPolarizationData Q) (hline : P.line = ⊥) :
    ∃ T : V →ₗ[ℂ] (TauCeti.spinPlusSubrep P hline).toSubmodule →ₗ[ℂ]
        (TauCeti.spinMinusSubrep P hline).toSubmodule →ₗ[ℂ] ℂ,
      T ≠ 0 ∧ ∀ (g : spinGroup Q) v s u,
        T ((spinToSpecialOrthogonal Q g : V ≃ₗ[ℂ] V) v)
            ((TauCeti.spinPlusSubrep P hline).toRepresentation g s)
            ((TauCeti.spinMinusSubrep P hline).toRepresentation g u) = T v s u := sorry

/-! ## Layer 9: Lie algebras acting through the Clifford algebra, and Kostant's isotypy corollary

The carrier is the native Kostant module: the Clifford algebra of the Killing quadratic form
`TauCeti.LieAlgebra.killingQuadraticForm ℂ L`, acted on by `L` through **left multiplication** by
the adjoint quadratic lift `CliffordAlgebra.adjointCliffordHom ℂ L` (the scoped instances
`CliffordAlgebra.kostantLieRingModule` and `kostantLieModule`, activated by `open CliffordAlgebra`).
This is the isotypic action; the commutator action `CliffordAlgebra.cliffordDerivationRep` is a
different module (`⋀𝔰𝔩₂ ≅ 1 ⊕ V(2) ⊕ V(2) ⊕ 1` under it). The simple constituent is the native
`L(ρ) = TauCeti.irreducibleQuotient b ρ`, `ρ = TauCeti.weylVector (LieAlgebra.IsKilling.rootSystem H) b`,
for a Cartan subalgebra `H` and a base `b`. -/

/-- **Kostant's isotypy corollary** (B. Kostant, Adv. Math. 125 (1997), the ρ-decomposition
paper): for Killing-semisimple `L` over `ℂ`, a Cartan subalgebra `H` and a base `b` of its root
system, every simple submodule of the left-regular `Cliff(L, κ)` is isomorphic to `L(ρ)`.
Nonvacuous because the carrier is finite-dimensional (`CliffordAlgebra.finrank_eq_two_pow`), so
simple submodules exist. -/
theorem kostant_isotypic (L : Type u) [LieRing L] [LieAlgebra ℂ L] [FiniteDimensional ℂ L]
    [LieAlgebra.IsKilling ℂ L] (H : LieSubalgebra ℂ L) [H.IsCartanSubalgebra]
    (b : (LieAlgebra.IsKilling.rootSystem H).Base)
    (S : LieSubmodule ℂ L (CliffordAlgebra (TauCeti.LieAlgebra.killingQuadraticForm ℂ L)))
    (hS : LieModule.IsIrreducible ℂ L S) :
    Nonempty (S ≃ₗ⁅ℂ,L⁆ TauCeti.irreducibleQuotient b
      (TauCeti.weylVector (LieAlgebra.IsKilling.rootSystem H) b)) := sorry

/-- **The multiplicity, as a pinned decomposition equivalence** (the summit of the layer):
`Cliff(L, κ)` is a direct sum of `2^((d+l)/2)` copies of `L(ρ)`, and `L(ρ)` has dimension
`2^((d-l)/2)`, where `d = dim L` and `l = LieAlgebra.rank ℂ L`. The divisions are exact by the
README's parity bookkeeping `d = l + 2 · #Δ⁺`, and the dimensions multiply to
`2^d = dim Cliff(L, κ)`. -/
theorem kostant_multiplicity (L : Type u) [LieRing L] [LieAlgebra ℂ L] [FiniteDimensional ℂ L]
    [LieAlgebra.IsKilling ℂ L] (H : LieSubalgebra ℂ L) [H.IsCartanSubalgebra]
    (b : (LieAlgebra.IsKilling.rootSystem H).Base) :
    Module.finrank ℂ (TauCeti.irreducibleQuotient b
        (TauCeti.weylVector (LieAlgebra.IsKilling.rootSystem H) b)) =
      2 ^ ((Module.finrank ℂ L - LieAlgebra.rank ℂ L) / 2) ∧
    Nonempty ((CliffordAlgebra (TauCeti.LieAlgebra.killingQuadraticForm ℂ L)) ≃ₗ⁅ℂ,L⁆
      ⨁ _ : Fin (2 ^ ((Module.finrank ℂ L + LieAlgebra.rank ℂ L) / 2)),
        TauCeti.irreducibleQuotient b
          (TauCeti.weylVector (LieAlgebra.IsKilling.rootSystem H) b)) := sorry

/-- **The spin module of `Cliff(L, κ)` restricted to `L`**: the full spinor module `⋀·W` of a
polarization `P` of the Killing quadratic form (in positive even dimension `S⁺ ⊕ S⁻`; at
dimension `0` it is `ℂ`), with `L` acting through the composite of the adjoint quadratic lift
with the native Fock action `TauCeti.spinAction`. The only definition this file needs: it makes
`kostantSpinRep_multiplicity` statable. -/
noncomputable def kostantSpinRep (L : Type u) [LieRing L] [LieAlgebra ℂ L]
    [FiniteDimensional ℂ L] [LieAlgebra.IsKilling ℂ L]
    (P : TauCeti.SpinPolarizationData (TauCeti.LieAlgebra.killingQuadraticForm ℂ L)) :
    L →ₗ⁅ℂ⁆ Module.End ℂ (ExteriorAlgebra ℂ P.W) :=
  ((TauCeti.spinAction (TauCeti.LieAlgebra.killingQuadraticForm ℂ L) P).toLieHom).comp
    (CliffordAlgebra.adjointCliffordHom ℂ L)

/-- **Kostant's spin-module multiplicity**: the full spinor module `⋀·W`, with `L` acting through
`kostantSpinRep`, is `L(ρ)`-isotypic with multiplicity `2^⌊l/2⌋`: a linear equivalence with a
direct sum of `2^⌊l/2⌋` copies of the native `L(ρ)` intertwines `kostantSpinRep` with the Lie
action on the direct sum. The dimensions agree: `dim ⋀·W = 2^⌊d/2⌋` and `d ≡ l (mod 2)`. It is
stated through an explicit intertwining equivalence because the action depends on the
polarization `P`, which an instance cannot carry. -/
theorem kostantSpinRep_multiplicity (L : Type u) [LieRing L] [LieAlgebra ℂ L]
    [FiniteDimensional ℂ L] [LieAlgebra.IsKilling ℂ L] (H : LieSubalgebra ℂ L)
    [H.IsCartanSubalgebra] (b : (LieAlgebra.IsKilling.rootSystem H).Base)
    (P : TauCeti.SpinPolarizationData (TauCeti.LieAlgebra.killingQuadraticForm ℂ L)) :
    ∃ e : ExteriorAlgebra ℂ P.W ≃ₗ[ℂ]
        ⨁ _ : Fin (2 ^ (LieAlgebra.rank ℂ L / 2)),
          TauCeti.irreducibleQuotient b
            (TauCeti.weylVector (LieAlgebra.IsKilling.rootSystem H) b),
      ∀ (x : L) (w : ExteriorAlgebra ℂ P.W), e (kostantSpinRep L P x w) = ⁅x, e w⁆ := sorry

end TauCetiRoadmap.RepresentationTheory.SpinRepresentations
