import Mathlib
import TauCeti.LinearAlgebra.CliffordAlgebra.Filtration
import TauCeti.LinearAlgebra.CliffordAlgebra.Quadratic.Lie.LeftRegular
import TauCeti.LinearAlgebra.CliffordAlgebra.Spin.SpecialOrthogonal
import TauCeti.RepresentationTheory.Spin.HalfSpin.Basic
import TauCeti.Algebra.Lie.HighestWeight.Verma
import TauCeti.LinearAlgebra.RootSystem.Weyl.Vector
import TauCeti.Algebra.Lie.D4.Tripled.Triality.Basic
import TauCeti.LinearAlgebra.CliffordAlgebra.Spin.LowRank.Six.SpecialLinear
import TauCeti.RepresentationTheory.Spin.Exceptional.Six.ExteriorSquare
import TauCeti.Topology.Algebra.CliffordAlgebra.Basic
import TauCeti.LinearAlgebra.CliffordAlgebra.Lipschitz.FullCover

/-!
# Clifford algebras, the Pin and Spin groups, and spin representations: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the single
definition (`kostantSpinRep`) one of them needs to be stated. Everything the pinned libraries
already prove is consumed by name in `README.md` and is not restated here: the structure theorem,
the double covers, the Fock module and its irreducibility, simple connectivity of compact `Spin(n)`
for `n ≥ 3` (`CliffordAlgebra.simplyConnectedSpace_realCliffordSpinGroupZero`), the type-`Bₗ`
identification `S ≅ L(ωₗ)` and the four type-`Dₗ` half-spin identifications for `l ≥ 4`
(`TauCeti.SpinPolarizationData.nonempty_lieModuleEquiv_typeBSpin_irreducibleQuotient` and the
`nonempty_lieModuleEquiv_typeDSpin{Plus,Minus}_irreducibleQuotient_…` theorems), `Spin₃ ≅ SL₂`,
`Spin₄ ≅ SL₂ × SL₂`, `Spin₆ ≅ SL₄` (`TauCeti.spinGroupEquivSpecialLinearGroupOfFinrankEqSix`), Bott
periodicity and the eightfold classification table of `Cliff(p, q)`
(`TauCeti.realClifford_classification`), and the `gl_N` CAR decomposition.

Headline theorems not statable at the pins, and what each lacks:

* the type-`Dₗ` identifications in half-rank `2` and `3` (Layer 5): the split Cartan basis
  `TauCeti.TypeDStd.lieBasis n hn` and the instance `TauCeti.TypeDStd.isKilling_typeD` need
  `4 ≤ n`;
* the group-level highest-weight corollary and the differential comparison (Layers 3 and 5): no
  smooth-group carrier for the complex `spinGroup Q` identifies the differential of
  `TauCeti.spinRep` with a Lie-algebra action;
* the maximal compact subgroup `K(p,q) ≅ (Spin(p) × Spin(q))/⟨(-1,-1)⟩` of `Spin(p,q)` and the
  Cartan homeomorphism `Spin(p,q) ≅ K(p,q) × ℝ^(p*q)` (Layer 7): the block Clifford inclusions of
  `Spin(p)` and `Spin(q)` into `Spin(p,q)` and the quotient `K(p,q)` are constructions of the
  roadmap;
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

/-- **Complex Spin groups are simply connected in dimension at least three.** For a
nondegenerate quadratic form on a complex vector space of dimension at least three, the native
`spinGroup Q`, with the subspace topology of the module topology on the Clifford algebra, is
simply connected. The bound is sharp: in dimension two the group is `ℂˣ`
(`CliffordAlgebra.not_simplyConnectedSpace_spinGroup_of_finrank_eq_two`), and
path-connectedness for dimension at least two is native
(`CliffordAlgebra.pathConnectedSpace_spinGroup_of_two_le_finrank`). README §2.3 deforms the
group onto its unitary part, compact `Spin(n)` (Gallier, arXiv:0805.0311v3, Theorem 1.24). -/
theorem simplyConnectedSpace_spinGroup_of_three_le_finrank {V : Type v} [AddCommGroup V]
    [Module ℂ V] [FiniteDimensional ℂ V] (Q : QuadraticForm ℂ V) (hQ : Q.Nondegenerate)
    (hV : 3 ≤ Module.finrank ℂ V) : SimplyConnectedSpace (spinGroup Q) := sorry

/-! ## Layer 6: the low-dimensional exceptional isomorphisms -/

/-- The vector representation of a six-dimensional nondegenerate complex quadratic space is
exterior square of the standard four-dimensional representation under the polarized
`Spin₆ ≃ SL₄` equivalence. The group equivalence is the one defined by the action on the
native even half-spin module, so the comparison retains the polarization. -/
theorem spin6_vector_equiv_exteriorSquare {V : Type v} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (Q : QuadraticForm ℂ V) (hQ : Q.Nondegenerate)
    (P : TauCeti.SpinPolarizationData Q) (hV : Module.finrank ℂ V = 6) :
    ∃ E : V ≃ₗ[ℂ] (⋀[ℂ]^2 (Fin 4 → ℂ)), ∀ (g : spinGroup Q) (v : V),
      E ((spinToSpecialOrthogonal Q g : V ≃ₗ[ℂ] V) v) =
        ((TauCeti.stdSLRep ℂ 4).exteriorPower 2
          (TauCeti.spinGroupEquivSpecialLinearGroupOfFinrankEqSix P hV g)) (E v) := sorry

/-! ## Layer 7: real Clifford algebras, Bott periodicity, and `Spin(p, q)` -/

/-- **The real full Clifford cover of the orthogonal group.** For a nondegenerate quadratic form
on a real vector space of positive finite dimension, the native normalized full cover
`CliffordAlgebra.cliffordFullCover Q` (Lipschitz elements of reverse norm `±1`) maps onto the
whole orthogonal group by twisted conjugation, with kernel of order two, the scalars `±1`.
Native `pinGroup Q` (star norm `1`) does not reach every reflection for an indefinite or
positive-definite form, so this is the Pin cover of all of `O(Q)` (Gallier, arXiv:0805.0311v3,
Definition 1.6 and Proposition 1.21). -/
theorem cliffordFullCoverToOrthogonal_surjective_and_card_ker {V : Type v} [AddCommGroup V]
    [Module ℝ V] [FiniteDimensional ℝ V] (Q : QuadraticForm ℝ V) (hQ : Q.Nondegenerate)
    (hV : 0 < Module.finrank ℝ V) :
    Function.Surjective (cliffordFullCoverToOrthogonal Q) ∧
      Nat.card (cliffordFullCoverToOrthogonal Q).ker = 2 := sorry

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
(Fulton–Harris, Lecture 20, §20.3). Its comparison with the octonion form
`TauCeti.Octonion.trialityTrilinearForm` is a README target of Layer 8. -/
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
theorem nonempty_kostant_isotypic (L : Type u) [LieRing L] [LieAlgebra ℂ L]
    [FiniteDimensional ℂ L] [LieAlgebra.IsKilling ℂ L] (H : LieSubalgebra ℂ L)
    [H.IsCartanSubalgebra] (b : (LieAlgebra.IsKilling.rootSystem H).Base)
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
