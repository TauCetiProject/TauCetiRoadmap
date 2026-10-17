import Mathlib
import TauCeti.AlgebraicGeometry.LineBundle.Class
import TauCeti.AlgebraicGeometry.LineBundle.Functoriality

/-!
# Algebraic moduli for arithmetic geometry: representative target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. The declarations below are suggested forms for the parts of the roadmap that can be
stated directly against the pinned Mathlib and Tau Ceti: the light definitions with real bodies,
the theorems whose every carrier exists at the pins or is one of those definitions, and one or
two discriminating examples for each kept definition. `sorry` marks a goal, not a result.

The heavy carriers are README targets with their intended signatures and do not appear here:
projective bundles of quasi-coherent modules and their twisting sheaves, coherent Grassmannians
and flags, the quasi-coherent descent pseudofunctor, relative Hom and Weil restriction presheaves,
the intrinsic band sheaf and the Hom sheaves of banded morphisms, gerbe classes in `H²`,
rigidifications and finite correspondences of stacks, Picard stack carriers and sheaves, framed
deformation groupoids, nonarchimedean analytifications and the resolution functor. Layers 5 and 8
consist of such targets only and have no section below.

Design choices made explicit here:

* Grassmannians parametrise locally free *quotients* (Mathlib's `Module.Grassmannian`), and a
  point of `P(E) = Proj Sym E` over `T` is an invertible quotient of `f^* E` (`LineQuotient`).
* A gerbe is a predicate `IsGerbe F J` on Mathlib's `Cat`-valued pseudofunctors extending
  `Pseudofunctor.IsStack`; an abelian banding is specified data with its restriction and
  conjugation equations; band-preserving transformations are a class on strong transformations.
* Formal points retain every positive power of the ideal; tangent fibres are fibres of the
  dual-number restriction over a fixed point, not all dual-number points.
* The relative Picard presheaf is `T ↦ Pic(X_T)` on schemes over the base, before fppf
  sheafification; its values are Tau Ceti's `LineBundleClass`.
* The order of an ideal at a prime is computed in the localisation, valued in `ℕ∞`; a marked
  ideal carries a strictly positive mark.
-/

open CategoryTheory Opposite Bicategory

universe u v w u' v' uI vI

noncomputable section

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

/-! ## Layer 1: projective parameter spaces -/

namespace ProjectiveParameterSpaces

open Module Module.Grassmannian

section Grassmannian

variable (R : Type u) [CommRing R] (M : Type u) [AddCommGroup M] [Module R M]

/-- Grassmannians parametrise locally free *quotients*: the Grassmannian of rank-`0` quotients has
exactly one point, the zero quotient (`Gr(0, E) = X` in the README). -/
theorem grassmannian_zero_subsingleton : Subsingleton G(0, M; R) := sorry

/-- A free module of rank `r` over a nontrivial ring has no locally free quotient of rank `k > r`
(`Gr(k, E) = ∅` above the rank). -/
theorem grassmannian_isEmpty_of_lt [Module.Free R M] [Module.Finite R M] [Nontrivial R] (k : ℕ)
    (hk : Module.finrank R M < k) : IsEmpty G(k, M; R) := sorry

/-- The Grassmannian of rank-`r` quotients of a free module of rank `r` over a nontrivial ring is a
single point, the identity quotient (`Gr(r, E) = X`). -/
theorem grassmannian_top_subsingleton [Module.Free R M] [Module.Finite R M] [Nontrivial R] :
    Subsingleton G(Module.finrank R M, M; R) := sorry

end Grassmannian

/-- The nonnegative field specialization of GroebnerGeometry G4's graded Hilbert polynomial:
for a finitely generated graded module `M = ⊕ ℳ n` over the
polynomial ring `k[X_σ]` with its standard grading, the Hilbert function `n ↦ dim_k ℳ n` agrees for
large `n` with a rational polynomial of degree less than the number of variables. Its rational
Hilbert-series presentation identifies it with Mathlib's `Polynomial.hilbertPoly` over `ℚ`.
The Hilbert function is Mathlib's `Module.finrank` of the graded piece. -/
theorem exists_hilbertPolynomial (k : Type u) [Field k] (σ : Type u) [Fintype σ]
    (M : Type u) [AddCommGroup M] [Module k M] [Module (MvPolynomial σ k) M]
    [IsScalarTower k (MvPolynomial σ k) M] [Module.Finite (MvPolynomial σ k) M]
    (ℳ : ℕ → Submodule k M) [SetLike.GradedSMul (MvPolynomial.homogeneousSubmodule σ k) ℳ]
    [DirectSum.Decomposition ℳ] :
    ∃ (P : Polynomial ℚ) (N : ℕ), P.natDegree ≤ Fintype.card σ - 1 ∧
      ∀ n, N ≤ n → P.eval (n : ℚ) = Module.finrank k (ℳ n) := sorry

/-- Hilbert–Serre over an Artinian coefficient ring: the graded pieces are finite and their
lengths agree for large `n` with a rational polynomial. The coefficients count lengths over `A`;
the polynomial has rational coefficients for every characteristic of `A`. -/
theorem exists_artinianHilbertPolynomial (A : Type u) [CommRing A] [IsArtinianRing A]
    (σ : Type u) [Fintype σ] (M : Type u) [AddCommGroup M] [Module A M]
    [Module (MvPolynomial σ A) M] [IsScalarTower A (MvPolynomial σ A) M]
    [Module.Finite (MvPolynomial σ A) M]
    (ℳ : ℕ → Submodule A M)
    [SetLike.GradedSMul (MvPolynomial.homogeneousSubmodule σ A) ℳ]
    [DirectSum.Decomposition ℳ] :
    (∀ n, Module.Finite A (ℳ n)) ∧
      ∃ (P : Polynomial ℚ) (N : ℕ), ∀ n, N ≤ n →
        P.eval (n : ℚ) = ((Module.length A (ℳ n)).toNat : ℚ) := sorry

/-- `HilbertFunctionChecks.zero`: every piece of the zero graded submodule has dimension zero. -/
example (k : Type u) [Field k] (n : ℕ) :
    Module.finrank k ((fun _ : ℕ => (⊥ : Submodule k (MvPolynomial (Fin 1) k))) n) = 0 := sorry

/-- `HilbertFunctionChecks.constant`: the degree-`n` piece of `k[x]` is spanned by `x^n`. -/
example (k : Type u) [Field k] (n : ℕ) :
    Module.finrank k (MvPolynomial.homogeneousSubmodule (Fin 1) k n) = 1 := sorry

/-- `HilbertFunctionChecks.degreeTwo`: `x²`, `xy`, `y²` form a basis of the quadratic piece. -/
example (k : Type u) [Field k] :
    Module.finrank k (MvPolynomial.homogeneousSubmodule (Fin 2) k 2) = 3 := sorry

/-- `HilbertFunctionChecks.cancelledDenominator`: cancelling a factor `1−T` in a rational
Hilbert-series presentation preserves the polynomial; `k[x]` has this series over every field. -/
example : Polynomial.hilbertPoly (1 - Polynomial.X : Polynomial ℚ) 2 =
    Polynomial.hilbertPoly (1 : Polynomial ℚ) 1 := by
  simpa using Polynomial.hilbertPoly_mul_one_sub_succ (1 : Polynomial ℚ) 1

/-- `HilbertLengthChecks.dualNumbers`: the constant graded piece over the dual numbers has
length two over its coefficient ring. -/
example (k : Type u) [Field k] :
    letI : CommRing (DualNumber k) := inferInstance
    Module.length (DualNumber k)
      (MvPolynomial.homogeneousSubmodule (Fin 1) (DualNumber k) 0) = 2 := sorry

/-- `HilbertLengthChecks.dualNumbers`: the constant piece of the residue-field polynomial ring
has length one over the dual numbers, acting through the augmentation. -/
example (k : Type u) [Field k] :
    letI : Algebra (DualNumber k) k := (TrivSqZeroExt.fstHom k k k).toRingHom.toAlgebra
    Module.length (DualNumber k)
      ((MvPolynomial.homogeneousSubmodule (Fin 1) k 0).restrictScalars (DualNumber k)) = 1 := sorry

end ProjectiveParameterSpaces

/-- The ordered maximal minors of the rank-two quotient graph matrix over any commutative ring
are its Plücker coordinates `(1, c, d, -a, -b, a*d-b*c)`, in the order
`p12, p13, p14, p23, p24, p34`; the column indices in Lean start at zero.
The scheme map and its determinant-line identity `pluckerEmbedding.pullback_twist` are
README §1.3 targets using the projective-bundle and exterior-sheaf carriers. -/
theorem pluckerEmbedding.chartCoordinates {R : Type u} [CommRing R] (a b c d : R) :
    let Q : Matrix (Fin 2) (Fin 4) R := !![1, 0, a, b; 0, 1, c, d]
    ![(Q.submatrix id ![0, 1]).det, (Q.submatrix id ![0, 2]).det,
      (Q.submatrix id ![0, 3]).det, (Q.submatrix id ![1, 2]).det,
      (Q.submatrix id ![1, 3]).det, (Q.submatrix id ![2, 3]).det] =
      (![1, c, d, -a, -b, a * d - b * c] : Fin 6 → R) := sorry

namespace ProjectiveBundles

open AlgebraicGeometry TauCeti.AlgebraicGeometry

/-- An invertible quotient of the pullback `f^* E`: the data of a `T`-point of
`P_S(E) = Proj_S Sym E` over `f`, in the quotient convention. It retains the quotient map, not only
the isomorphism class of the line. -/
structure LineQuotient {S T : Scheme.{u}} (f : T ⟶ S) (E : S.Modules) where
  /-- The invertible target line on the test scheme. -/
  line : InvertibleSheaf T
  /-- The quotient morphism from the pulled-back module to that line. -/
  quotient : (Scheme.Modules.pullback f).obj E ⟶ line.obj
  /-- The quotient morphism is an epimorphism of module sheaves. -/
  surjective : Epi quotient

/-- `ProjectiveBundleTests.zero`: the zero module has no invertible quotient on a nonempty test
scheme, so `P(0)` is empty. -/
example {S T : Scheme.{u}} (f : T ⟶ S) [Nonempty T] :
    IsEmpty (LineQuotient f (SheafOfModules.free (R := S.ringCatSheaf) PEmpty.{u + 1})) := sorry

/-- The exponent vectors indexing the Laurent Čech basis of `H^q(P^n_A, O(m))`: in degree `0`
the nonnegative vectors of sum `m` (every vector when `n = 0`, since `P^0_A = Spec A`), in degree
`n ≥ 1` the vectors of sum `m` with all entries negative, and nothing in other degrees. -/
def projectiveTwistBasis (n q : ℕ) (m : ℤ) : Type :=
  {e : Fin (n + 1) → ℤ // (∑ i, e i) = m ∧
    ((q = 0 ∧ (n = 0 ∨ ∀ i, 0 ≤ e i)) ∨ (0 < n ∧ q = n ∧ ∀ i, e i < 0))}

/-- `ProjectiveTwistCohomologyTests.topLine`: `H¹(P¹_A, O(−2))` has the single basis vector
`(−1, −1)`. -/
example : Nat.card (projectiveTwistBasis 1 1 (-2)) = 1 := sorry

/-- `ProjectiveTwistCohomologyTests.lineBoundary`: `H¹(P¹_A, O(−1)) = 0`. -/
example : IsEmpty (projectiveTwistBasis 1 1 (-1)) := sorry

/-- `ProjectiveTwistCohomologyTests.pointNegative`: on `P⁰_A = Spec A` every twist is trivial, so
`H⁰(P⁰_A, O(−7))` has one basis vector even though the exponent is negative. -/
example : Nat.card (projectiveTwistBasis 0 0 (-7)) = 1 := sorry

/-- The finite cutoff of the coefficient-fixing Frobenius `u ↦ u^p` on coefficient vectors: the
coefficient in degree `j < N` is placed in degree `p j ≤ p N`. Every matrix entry is `0` or `1`;
the map is linear over the coefficients and does not raise them to the `p`-th power. -/
def coefficientFrobeniusCutoff (R : Type u) [CommRing R] (p N : ℕ) :
    (Fin N → R) →ₗ[R] (Fin (p * N + 1) → R) :=
  Matrix.mulVecLin (fun (i : Fin (p * N + 1)) (j : Fin N) =>
    if i.val = p * j.val then (1 : R) else 0)

/-- A coefficient `t` in degree `j` is carried unchanged to degree `p j`, including when
`t^p ≠ t`. -/
theorem coefficientFrobeniusLattice (R : Type u) [CommRing R] (p N : ℕ)
    (j : Fin N) (t : R) :
    coefficientFrobeniusCutoff R p N (Pi.single j t) =
      fun i => if i.val = p * j.val then t else 0 := sorry

/-- `CoefficientFrobeniusTests.zero`: the coefficient-linear cutoff sends the zero vector to zero. -/
example (R : Type u) [CommRing R] (p N : ℕ) :
    coefficientFrobeniusCutoff R p N 0 = 0 := by simp

/-- `CoefficientFrobeniusTests.monomial`: for `p = N = 3`, coefficient `5` in degree `2` over
`ℤ` maps to coefficient `5` in degree `6`, with exactly that nonzero support. -/
example :
    let v := coefficientFrobeniusCutoff ℤ 3 3 (Pi.single (2 : Fin 3) (5 : ℤ))
    v = Pi.single (6 : Fin 10) (5 : ℤ) ∧ ∀ i : Fin 10, v i ≠ 0 ↔ i.val = 6 := sorry

/-- `CoefficientFrobeniusTests.nonFixedCoefficient`: in characteristic `p` with `t^p ≠ t`, the
constant coefficient of the cutoff image is `t`, not `t^p`. -/
example (p : ℕ) (hp : p.Prime) (k : Type u) [Field k] [CharP k p]
    (t : k) (h : t ^ p ≠ t) :
    coefficientFrobeniusCutoff k p 1 (fun _ => t) 0 ≠ t ^ p := sorry

end ProjectiveBundles

/-! ## Layer 2: Hom, Isom and coherent dévissage -/

namespace HomIsom

open AlgebraicGeometry

variable (k : Type u) [Field k]

/-- The closed point `Spec k → Spec k[ε]` of the dual numbers. It represents the degree-one Hilbert
functor of itself over `Spec k[ε]`; its universal family is the identity. -/
noncomputable def dualNumberPoint :
    Spec (CommRingCat.of k) ⟶ Spec (CommRingCat.of (DualNumber k)) :=
  Spec.map (CommRingCat.ofHom (TrivSqZeroExt.fstHom k k k).toRingHom)

/-- `HilbertTests.nonflatParameter`: the parameter morphism `Spec k → Spec k[ε]` is not flat,
although the universal family over it (the identity) is flat. -/
theorem not_flat_dualNumberPoint : ¬ Flat (dualNumberPoint k) := sorry

end HomIsom

/-! ## Layer 3: effective descent and finite-source restriction -/

section QuasicoherentPullback

open AlgebraicGeometry

/-- `AffinePullbackTests.nonflat`: along the nonflat map `ℤ → ℤ/2`, multiplication by `2` on
`O_{Spec ℤ}` is a monomorphism whose pullback is the zero endomorphism of the nonzero sheaf
`O_{Spec 𝔽₂}`. Pullback of quasi-coherent modules is right exact, not exact. -/
example :
    let f := CommRingCat.ofHom (Int.castRingHom (ZMod 2))
    let h := (tilde.functor (CommRingCat.of ℤ)).map
      (ModuleCat.ofHom (2 • LinearMap.id : ℤ →ₗ[ℤ] ℤ))
    Mono h ∧
      (Scheme.Modules.pullback (Spec.map f)).map h = 0 ∧
      ¬ Mono ((Scheme.Modules.pullback (Spec.map f)).map h) := by
  sorry

end QuasicoherentPullback

open TensorProduct in
/-- Finite presentation of a module descends along a faithfully flat ring map. Mathlib proves the
finitely generated case (`Module.Finite.of_finite_tensorProduct_of_faithfullyFlat`) and the
algebra case (`Algebra.FinitePresentation.of_finitePresentation_tensorProduct_of_faithfullyFlat`). -/
theorem finite_presentation_of_faithfully_flat
    {R S M : Type u} [CommRing R] [CommRing S] [Algebra R S]
    [AddCommGroup M] [Module R M] [Module.FaithfullyFlat R S]
    [Module.FinitePresentation S (S ⊗[R] M)] :
    Module.FinitePresentation R M := sorry

namespace AffineModuleDescent

/-- Mathlib's module pseudofunctor, indexed by opposite affine arrows so that restriction along
`Spec A → Spec R` is extension of scalars along `R → A`. -/
abbrev affineModulePullback :
    Pseudofunctor (LocallyDiscrete CommRingCat.{u}ᵒᵖᵒᵖ) Cat :=
  (CategoryTheory.unopUnop CommRingCat.{u}).toPseudofunctor.comp
    CommRingCat.moduleCatExtendScalarsPseudofunctor

variable {R A : Type u} [CommRing R] [CommRing A]

/-- Effective faithfully flat descent of modules: for a faithfully flat ring map `R → A`, the
canonical functor from `R`-modules to descent data for the singleton family `Spec A → Spec R` is an
equivalence of categories. Mathlib supplies the comonadicity of extension of scalars
(`comonadicExtendScalars`); this is the descent-data form. -/
theorem faithfullyFlatDescent (f : R →+* A) (hf : f.FaithfullyFlat) :
    (affineModulePullback.toDescentData
      (fun (_ : PUnit) ↦ (CommRingCat.ofHom f).op)).IsEquivalence := sorry

/-- `ModuleNativeChecks.arrows`: the canonical descent functor extends every module map, including
noninvertible maps; its component at the single index is `extendScalars f` of the map. -/
example (f : R →+* A) {M N : ModuleCat.{u} R} (h : M ⟶ N) :
    ((affineModulePullback.toDescentData
      (fun (_ : PUnit) ↦ (CommRingCat.ofHom f).op)).map h).hom PUnit.unit =
      (ModuleCat.extendScalars f).map h := sorry

end AffineModuleDescent

/-! ## Layer 4: gerbes, bands and profinite stages -/

section Gerbes

variable {C : Type u} [Category.{v} C]

/-- A gerbe on `(C, J)`: a stack (Mathlib's `Pseudofunctor.IsStack`) whose fibres are groupoids,
which is locally nonempty and whose objects are locally isomorphic. `IsStack` alone does not
impose groupoid fibres. -/
class IsGerbe (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
    (J : GrothendieckTopology C) : Prop extends F.IsStack J where
  /-- Every arrow of every fibre category is invertible. -/
  isIso_hom : ∀ (U : C) {x y : F.obj (.mk (op U))} (f : x ⟶ y), IsIso f
  /-- A covering sieve supplies an object in each pulled-back fibre. -/
  locallyNonempty : ∀ U : C, ∃ R : Sieve U, R ∈ J U ∧
    ∀ ⦃V : C⦄ (f : V ⟶ U), R f → Nonempty (F.obj (.mk (op V)))
  /-- Any two objects become isomorphic along a covering sieve. -/
  locallyIsomorphic : ∀ (U : C) (x y : F.obj (.mk (op U))),
    ∃ R : Sieve U, R ∈ J U ∧ ∀ ⦃V : C⦄ (f : V ⟶ U), R f →
      Nonempty ((F.map f.op.toLoc).toFunctor.obj x ≅
        (F.map f.op.toLoc).toFunctor.obj y)

variable {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} {J : GrothendieckTopology C}

/-- A pseudonatural transformation over `C` which is an equivalence on every fibre preserves and
reflects `IsGerbe` (Stacks, Section 8.11, tag 06NY, Lemma 8.11.2). -/
theorem IsGerbe.equivalence_iff (η : Pseudofunctor.StrongTrans F G)
    (hη : ∀ U : C, (η.app (.mk (op U))).toFunctor.IsEquivalence) :
    IsGerbe F J ↔ IsGerbe G J := sorry

/-- An abelian banding of a gerbe by an abelian sheaf `A`: group isomorphisms
`A(U) ≃* Aut x` for every object `x` over `U`, compatible with restriction and unchanged by
conjugation along object isomorphisms. -/
structure AbelianBanding (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
    (J : GrothendieckTopology C) (A : Sheaf J AddCommGrpCat.{w})
    [IsGerbe F J] where
  /-- The banding identifies the sections of `A` with the automorphisms of each object. -/
  autEquiv : ∀ (U : C) (x : F.obj (.mk (op U))),
    Multiplicative (A.obj.obj (op U)) ≃* Aut x
  /-- The identification commutes with restriction and the pseudofunctor comparison. -/
  pullback : ∀ {U V : C} (f : V ⟶ U) (x : F.obj (.mk (op U)))
      (a : Multiplicative (A.obj.obj (op U))),
    (F.map f.op.toLoc).toFunctor.mapAut x (autEquiv U x a) =
      autEquiv V ((F.map f.op.toLoc).toFunctor.obj x)
        (Multiplicative.ofAdd ((A.obj.map f.op) (Multiplicative.toAdd a)))
  /-- Object isomorphisms conjugate the identified automorphisms without changing the
  coefficient. -/
  conjugation : ∀ (U : C) {x y : F.obj (.mk (op U))} (e : x ≅ y)
      (a : Multiplicative (A.obj.obj (op U))),
    Aut.autMulEquivOfIso e (autEquiv U x a) = autEquiv U y a

variable {A : Sheaf J AddCommGrpCat.{w}} [IsGerbe F J]

/-- An abelian banding forces every automorphism group of every fibre to be commutative. -/
theorem banded_aut_commute (b : AbelianBanding F J A) (U : C)
    (x : F.obj (.mk (op U))) (a a' : Aut x) : a * a' = a' * a := sorry

/-- `BandingTests.zero`: if `A(U)` is trivial, an `A`-banding makes every `Aut x` over `U`
trivial. -/
example (b : AbelianBanding F J A) (U : C)
    [Subsingleton (A.obj.obj (op U))] (x : F.obj (.mk (op U))) :
    ∀ a : Aut x, a = 1 := sorry

/-- `BandingTests.nonabelian`: a gerbe with an object whose automorphism group is `S₃` admits no
abelian banding. -/
example (U : C) (x : F.obj (.mk (op U)))
    (e : Aut x ≃* Equiv.Perm (Fin 3)) :
    ¬ Nonempty (AbelianBanding F J A) := sorry

/-- A neutralization over `S`: an object of the fibre over `S`. -/
structure Neutralization (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}) (S : C) where
  /-- The chosen global object. -/
  obj : F.obj (.mk (op S))

/-- Neutrality: a global object over the specified terminal object of the site. Sites without a
terminal object use the terminal sheaf of the topos (README, Conventions). -/
def IsNeutral (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}) (S : C)
    (_hS : Limits.IsTerminal S) : Prop :=
  Nonempty (Neutralization F S)

/-- `NeutralizationTests.automorphisms`: a neutralization `x` still has automorphism group
`A(S)`; choosing a point does not remove the inertia. -/
example (b : AbelianBanding F J A) (S : C) (x : Neutralization F S) :
    Nonempty (Multiplicative (A.obj.obj (op S)) ≃* Aut x.obj) := sorry

variable [IsGerbe G J]

/-- A strong transformation preserves two specified bandings by the same sheaf `A` when its
component functors carry each band automorphism to the band automorphism of the same
coefficient. -/
class BandPreserving (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) : Prop where
  /-- The transformation carries each band automorphism to the same target-band coefficient. -/
  map_band : ∀ (U : C) (x : F.obj (.mk (op U)))
      (a : Multiplicative (A.obj.obj (op U))),
    (η.app (.mk (op U))).toFunctor.mapAut x (bF.autEquiv U x a) =
      bG.autEquiv U ((η.app (.mk (op U))).toFunctor.obj x) a

/-- The identity transformation is band-preserving. -/
theorem BandPreserving.id (b : AbelianBanding F J A) :
    BandPreserving b b (Pseudofunctor.StrongTrans.id F) := sorry

/-- Composites of band-preserving transformations are band-preserving. -/
theorem BandPreserving.comp
    {H : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe H J]
    (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (bH : AbelianBanding H J A)
    (η : Pseudofunctor.StrongTrans F G) (θ : Pseudofunctor.StrongTrans G H)
    [BandPreserving bF bG η] [BandPreserving bG bH θ] :
    BandPreserving bF bH (Pseudofunctor.StrongTrans.vcomp η θ) := sorry

/-- A morphism of gerbes preserving a common abelian band is an equivalence on every fibre
(Olsson's stacks lectures, notes by Geraschenko, Várilly, Carter, Shiu et al., Lemma 31.3, p. 122):
faithful by the banding, full by Hom-sheaf descent and essentially surjective by gluing local
preimages. -/
theorem band_morphism_equivalence
    (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η] (U : C) :
    (η.app (.mk (op U))).toFunctor.IsEquivalence := sorry

end Gerbes

section LimitFamilies

variable {I : Type uI} [Category.{vI} I]

/-- A compatible family in a `Cat`-valued pseudo-diagram `Φ` on `I`: an object at every stage with
transition isomorphisms satisfying the unit and composition laws. These are the objects of the
pseudo-limit; for a cofiltered diagram of finite-stage gerbes evaluated at a test object they are
the objects of the profinite gerbe. Functoriality in the diagram, the functor
`GerbeLimitFamily.pullback` along a strong transformation with `pullback_component`, is a README
target (§4.4). -/
structure GerbeLimitFamily (Φ : LocallyDiscrete I ⥤ᵖ Cat.{v', u'}) where
  /-- An object at every stage. -/
  component : ∀ i : I, Φ.obj (.mk i)
  /-- A specified transition isomorphism from each transported stage object. -/
  transition : ∀ {i j : I} (f : i ⟶ j),
    (Φ.map f.toLoc).toFunctor.obj (component i) ≅ component j
  /-- The identity transition agrees with the diagram unitor. -/
  transition_id : ∀ i : I,
    (transition (𝟙 i)).hom =
      (Φ.mapId (.mk i)).hom.toNatTrans.app (component i)
  /-- Two transitions agree with the composite after the diagram composition comparison. -/
  transition_comp : ∀ {i j k : I} (f : i ⟶ j) (g : j ⟶ k),
    (Φ.mapComp f.toLoc g.toLoc).hom.toNatTrans.app (component i) ≫
      (Φ.map g.toLoc).toFunctor.map (transition f).hom ≫
      (transition g).hom = (transition (f ≫ g)).hom

namespace GerbeLimitFamily

variable {Φ : LocallyDiscrete I ⥤ᵖ Cat.{v', u'}}

/-- Arrows of compatible families: an arrow at every stage commuting with the transitions. -/
@[ext]
structure Hom (x y : GerbeLimitFamily Φ) where
  /-- An actual fibre arrow at every stage. -/
  component : ∀ i : I, x.component i ⟶ y.component i
  /-- Each stage arrow commutes with the transition isomorphisms of the two families. -/
  naturality : ∀ {i j : I} (f : i ⟶ j),
    (Φ.map f.toLoc).toFunctor.map (component i) ≫ (y.transition f).hom =
      (x.transition f).hom ≫ component j

/-- Compatible families form a category with componentwise identities and composition. -/
instance category : Category (GerbeLimitFamily Φ) where
  Hom := Hom
  id x := ⟨fun i => 𝟙 (x.component i), fun f => by simp⟩
  comp f g := ⟨fun i => f.component i ≫ g.component i, fun h => by
    rw [Functor.map_comp, Category.assoc, g.naturality, ← Category.assoc, f.naturality,
      Category.assoc]⟩
  id_comp f := Hom.ext (funext fun i => Category.id_comp (f.component i))
  comp_id f := Hom.ext (funext fun i => Category.comp_id (f.component i))
  assoc f g h := Hom.ext (funext fun i => Category.assoc (f.component i) (g.component i)
    (h.component i))

/-- Two arrows of compatible families are equal when all their components agree. -/
theorem hom_ext {x y : GerbeLimitFamily Φ} (f g : x ⟶ y)
    (h : ∀ i, Hom.component f i = Hom.component g i) : f = g :=
  Hom.ext (funext h)

/-- Evaluation at a stage, on objects and arrows. -/
def evaluation (i : I) : GerbeLimitFamily Φ ⥤ Φ.obj (.mk i) where
  obj x := x.component i
  map f := Hom.component f i
  map_id _ := rfl
  map_comp _ _ := rfl

/-- Evaluation of an arrow is its component. -/
theorem evaluation_map (i : I) {x y : GerbeLimitFamily Φ} (f : x ⟶ y) :
    (evaluation i).map f = Hom.component f i := rfl

/-- An arrow of compatible families with invertible components is invertible. -/
theorem isIso_of_components {x y : GerbeLimitFamily Φ} (f : x ⟶ y)
    (hf : ∀ i : I, IsIso (Hom.component f i)) : IsIso f := sorry

/-- `LimitFamilyTests.singleton`: on the one-object discrete index the compatible families are
equivalent to the single stage, for any unit data of `Φ`. -/
example (Φ : LocallyDiscrete (Discrete PUnit) ⥤ᵖ Cat.{v', u'}) :
    Nonempty (GerbeLimitFamily Φ ≌ Φ.obj (.mk (Discrete.mk PUnit.unit))) := sorry

/-- `LimitFamilyTests.cyclic`: the constant diagram with value `B(ℤ/3)` has one isomorphism class
of compatible families, whose automorphism group has three elements: the arrows of the groupoid
are retained, not only its isomorphism classes. -/
example :
    let Φ := ((Functor.const (Discrete PUnit)).obj
      (Cat.of (SingleObj (Multiplicative (ZMod 3))))).toPseudofunctor'
    Nonempty (GerbeLimitFamily Φ) ∧
      Subsingleton (Skeleton (GerbeLimitFamily Φ)) ∧
      ∀ x : GerbeLimitFamily Φ, Nat.card (x ⟶ x) = 3 := sorry

end GerbeLimitFamily

end LimitFamilies

section IntrinsicBand

variable {C : Type u} [Category.{v} C]
variable (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})

/-- The sections over `U` of the intrinsic band: families of units of the centres of the fibre
categories over every `V → U`, compatible with every restriction. For a gerbe with commutative
automorphism groups these are the sections of the band sheaf (README §4.6). -/
noncomputable def intrinsicBandSectionSubgroup (U : C) :
    Subgroup (∀ (V : C), (V ⟶ U) → (CatCenter (F.obj (.mk (op V))))ˣ) where
  carrier := {z | ∀ (V W : C) (f : V ⟶ U) (g : W ⟶ V)
      (x : F.obj (.mk (op V))),
    (F.map g.op.toLoc).toFunctor.map ((z V f).val.app x) =
      (z W (g ≫ f)).val.app ((F.map g.op.toLoc).toFunctor.obj x)}
  one_mem' := by
    intro V W f g x
    exact (F.map g.op.toLoc).toFunctor.map_id x
  mul_mem' := by
    intro s t hs ht V W f g x
    change (F.map g.op.toLoc).toFunctor.map
      ((t V f).val.app x ≫ (s V f).val.app x) =
      (t W (g ≫ f)).val.app _ ≫ (s W (g ≫ f)).val.app _
    rw [Functor.map_comp, hs V W f g x, ht V W f g x]
  inv_mem' := by
    intro s hs V W f g x
    let e := (Aut.unitsEndEquivAut (𝟭 (F.obj (.mk (op V)))) (s V f)).app x
    let e' := (Aut.unitsEndEquivAut (𝟭 (F.obj (.mk (op W)))) (s W (g ≫ f))).app
      ((F.map g.op.toLoc).toFunctor.obj x)
    have h : (F.map g.op.toLoc).toFunctor.mapIso e = e' := by
      apply Iso.ext
      exact hs V W f g x
    exact congrArg Iso.inv h

/-- The group of sections over `U` of the intrinsic band. -/
abbrev IntrinsicBandSection (U : C) := ↥(intrinsicBandSectionSubgroup F U)

variable (J : GrothendieckTopology C) [IsGerbe F J]

include J in
/-- `BandCenterTests.C3`: for a gerbe with commutative automorphism groups and an object over `U`
with automorphism group `ℤ/3`, the intrinsic band has three sections over `U`. -/
example (hComm : ∀ (U : C) (x : F.obj (.mk (op U))) (a b : Aut x), a * b = b * a)
    (U : C) (x : F.obj (.mk (op U))) (e : Aut x ≃* Multiplicative (ZMod 3)) :
    Nat.card (IntrinsicBandSection F U) = 3 := sorry

include J in
/-- `BandCenterTests.S3`: for a gerbe and an object with automorphism group `S₃` the sections of the
intrinsic band form the trivial centre of `S₃`, not all six automorphisms. -/
example (U : C) (x : F.obj (.mk (op U)))
    (e : Aut x ≃* Equiv.Perm (Fin 3)) :
    Nat.card (IntrinsicBandSection F U) = 1 := sorry

end IntrinsicBand

/-! ## Layer 6: G-rings and algebraic approximation -/

namespace Approximation

variable (A : Type u) [CommRing A] [IsLocalRing A]

/-- `A` has the Artin approximation property: every solution in the completion `Â` of a system of
polynomial equations over `A` (an `A`-algebra map from a finitely presented `A`-algebra) is
congruent modulo every power of the maximal ideal to a solution in `A`. -/
def HasArtinApproximation : Prop :=
  ∀ (B : Type u) [CommRing B] [Algebra A B], Algebra.FinitePresentation A B →
    ∀ (φ : B →ₐ[A] AdicCompletion (IsLocalRing.maximalIdeal A) A) (n : ℕ),
      ∃ ψ : B →ₐ[A] A, ∀ b : B,
        φ b - algebraMap A (AdicCompletion (IsLocalRing.maximalIdeal A) A) (ψ b) ∈
          (Ideal.map (algebraMap A (AdicCompletion (IsLocalRing.maximalIdeal A) A))
            (IsLocalRing.maximalIdeal A)) ^ n

/-- `ApproximationTests.complete`: a complete Noetherian local ring approximates its own
solutions exactly, the degenerate case of Artin approximation. -/
theorem hasArtinApproximation_of_isAdicComplete [IsNoetherianRing A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A] : HasArtinApproximation A := sorry

/-- `ApproximationTests.field`: the completion of a field at its zero maximal ideal changes no
solution. -/
example (K : Type u) [Field K] : HasArtinApproximation K := sorry

end Approximation

/-! ## Layer 7: space Picard, Artin representability and arithmetic coefficients -/

namespace CoherentModuleChecks

variable (R : Type u) [CommRing R] (t : R)

/-- `CoherentModuleChecks.movingSectionsHom`: maps between the two section modules over `R[x]`
correspond to multipliers annihilated by the image `t` of the base parameter. -/
example : Nonempty
    (((Polynomial R ⧸ Ideal.span {(Polynomial.X : Polynomial R)}) →ₗ[Polynomial R]
      (Polynomial R ⧸ Ideal.span {Polynomial.X - Polynomial.C t})) ≃
      {b : R // t * b = 0}) := sorry

/-- `CoherentModuleChecks.movingSectionsIsom`: isomorphisms between the two section modules
correspond to unit multipliers annihilated by `t`, so they exist exactly over the fibre `t = 0`.
The parameter ring of this functor is `k[t,z,z⁻¹]/(t)`. -/
example : Nonempty
    (((Polynomial R ⧸ Ideal.span {(Polynomial.X : Polynomial R)}) ≃ₗ[Polynomial R]
      (Polynomial R ⧸ Ideal.span {Polynomial.X - Polynomial.C t})) ≃
      {b : Rˣ // t * (b : R) = 0}) := sorry

end CoherentModuleChecks

namespace ArtinCriteria

open CategoryTheory.Limits

variable (F : CommRingCat.{u} ⥤ Type u)

/-- Schlessinger–Rim's condition (RS) in its affine form: the comparison map of `F` is bijective on
every ring pullback `A ×_C B` along a surjection `B → C` with square-zero kernel. -/
def StrongInfinitesimalGluing : Prop :=
  ∀ {A B C : CommRingCat.{u}} (f : A ⟶ C) (g : B ⟶ C),
    Function.Surjective g.hom → RingHom.ker g.hom ^ 2 = ⊥ →
      IsIso (pullbackComparison F f g)

/-- A functor preserving finite limits satisfies (RS). -/
theorem StrongInfinitesimalGluing.of_preservesLimits
    [PreservesFiniteLimits F] : StrongInfinitesimalGluing F := sorry

/-- Under (RS) every permitted ring pullback has a bijective canonical comparison. -/
theorem StrongInfinitesimalGluing.comparison_bijective
    (hF : StrongInfinitesimalGluing F)
    {A B C : CommRingCat.{u}} (f : A ⟶ C) (g : B ⟶ C)
    (hg : Function.Surjective g.hom) (hker : RingHom.ker g.hom ^ 2 = ⊥) :
    Function.Bijective (pullbackComparison F f g) := sorry

/-- A natural isomorphism of functors transports (RS). -/
theorem StrongInfinitesimalGluing.transport
    {G : CommRingCat.{u} ⥤ Type u} (e : F ≅ G)
    (hF : StrongInfinitesimalGluing F) : StrongInfinitesimalGluing G := sorry

/-- `StrongGluingTests.forget`: the underlying-set functor (the affine line) satisfies (RS). -/
example : StrongInfinitesimalGluing (forget CommRingCat.{u}) := sorry

/-- Direct image of subsets: a functor of points that fails (RS). -/
def StrongGluingTests.subsetImage : CommRingCat.{u} ⥤ Type u where
  obj R := Set R
  map f := TypeCat.ofHom (Set.image f)
  map_id R := by ext s x; simp
  map_comp f g := by ext s x; simp

/-- `StrongGluingTests.subsetFailure`: for both maps `ℚ[ε] → ℚ`, the diagonal subset and the whole
pullback have the same two projections but differ, so the comparison is not injective even along a
square-zero surjection. -/
example : ¬ StrongInfinitesimalGluing StrongGluingTests.subsetImage.{0} := sorry

variable (R : Type u) [CommRing R] (I : Ideal R)

/-- A formal point of `F` along `I`: compatible points over all quotients `R / I^(n+1)`, retaining
every order. -/
structure FormalPoint where
  /-- A point over every quotient by a positive power of `I`. -/
  value : ∀ n : ℕ, F.obj (CommRingCat.of (R ⧸ I ^ (n + 1)))
  /-- The quotient transition maps carry each component to the lower components. -/
  compatible : ∀ {m n : ℕ} (h : n ≤ m),
    F.map (CommRingCat.ofHom (Ideal.Quotient.factorPow I (Nat.add_le_add_right h 1)))
      (value m) = value n

/-- The formal point obtained by restricting a point over `R` to every quotient. -/
def FormalPoint.ofPoint (x : F.obj (CommRingCat.of R)) : FormalPoint F R I where
  value n := F.map (CommRingCat.ofHom (Ideal.Quotient.mk (I ^ (n + 1)))) x
  compatible h := by
    rw [← Functor.map_comp_apply]
    rfl

/-- Two formal points are equal when all their components agree. -/
theorem FormalPoint.ext {x y : FormalPoint F R I}
    (h : ∀ n, x.value n = y.value n) : x = y := sorry

/-- The `n`-th component of a restricted point is its image over `R / I^(n+1)`. -/
theorem FormalPoint.ofPoint_value (x : F.obj (CommRingCat.of R)) (n : ℕ) :
    (FormalPoint.ofPoint F R I x).value n =
      F.map (CommRingCat.ofHom (Ideal.Quotient.mk (I ^ (n + 1)))) x := rfl

/-- A natural transformation `F ⟶ G` sends a formal point of `F` to the family of component
images. -/
def FormalPoint.map {G : CommRingCat.{u} ⥤ Type u} (η : F ⟶ G)
    (ξ : FormalPoint F R I) : FormalPoint G R I where
  value n := η.app _ (ξ.value n)
  compatible h := by
    rw [← ξ.compatible h, NatTrans.naturality_apply]

/-- The `n`-th component of the image family is `η` applied to the original component. -/
theorem FormalPoint.map_value {G : CommRingCat.{u} ⥤ Type u} (η : F ⟶ G)
    (ξ : FormalPoint F R I) (n : ℕ) :
    (FormalPoint.map F R I η ξ).value n = η.app _ (ξ.value n) := rfl

/-- `FormalPointTests.specialFibreInsufficient`: on `ℚ[ε]` with `I = (ε)`, the points `0` and `ε`
agree modulo `I` but not modulo `I² = 0`; the special fibre does not determine a formal point. -/
example :
    let J : Ideal (TrivSqZeroExt ℚ ℚ) :=
      RingHom.ker (TrivSqZeroExt.fstHom ℚ ℚ ℚ).toRingHom
    let x := FormalPoint.ofPoint (forget CommRingCat.{0}) (TrivSqZeroExt ℚ ℚ) J 0
    let y := FormalPoint.ofPoint (forget CommRingCat.{0}) (TrivSqZeroExt ℚ ℚ) J
      (TrivSqZeroExt.inr (1 : ℚ))
    x.value 0 = y.value 0 ∧ x.value 1 ≠ y.value 1 := sorry

/-- `FormalPointTests.firstOrderInsufficient`: on `ℚ[t]/(t³)` with `I = (t)`, the points `0` and
`t²` agree modulo `I` and modulo `I²` but not modulo `I³ = 0`; the residue together with the
first-order jet does not determine a formal point. -/
example :
    let x := FormalPoint.ofPoint (forget CommRingCat.{0})
      (AdjoinRoot (Polynomial.X ^ 3 : Polynomial ℚ))
      (Ideal.span {AdjoinRoot.root (Polynomial.X ^ 3 : Polynomial ℚ)}) 0
    let y := FormalPoint.ofPoint (forget CommRingCat.{0})
      (AdjoinRoot (Polynomial.X ^ 3 : Polynomial ℚ))
      (Ideal.span {AdjoinRoot.root (Polynomial.X ^ 3 : Polynomial ℚ)})
      (AdjoinRoot.root (Polynomial.X ^ 3 : Polynomial ℚ) ^ 2)
    x.value 0 = y.value 0 ∧ x.value 1 = y.value 1 ∧ x.value 2 ≠ y.value 2 := sorry

/-- Effectivity of `F` along `I`: every formal point is restricted from a point over `R`. This is
the set-valued affine form; the groupoid form for formal objects of a stack (README §7.1, with
`ofRestriction`, `iso_iff` and `all_iff`) also asks for the specified isomorphism and is a README
target. -/
def IsEffective : Prop := Function.Surjective (FormalPoint.ofPoint F R I)

/-- Effectivity in the form "every formal point lifts". -/
theorem IsEffective.iff_lift : IsEffective F R I ↔
    ∀ ξ : FormalPoint F R I, ∃ x, FormalPoint.ofPoint F R I x = ξ := Iff.rfl

/-- A point over `R` realising a formal point, chosen from an effectivity proof. -/
def IsEffective.lift (h : IsEffective F R I) (ξ : FormalPoint F R I) :
    F.obj (CommRingCat.of R) := Classical.choose (h ξ)

/-- The chosen lift restricts to the given formal point. -/
theorem IsEffective.lift_spec (h : IsEffective F R I) (ξ : FormalPoint F R I) :
    FormalPoint.ofPoint F R I (IsEffective.lift F R I h ξ) = ξ :=
  Classical.choose_spec (h ξ)

/-- A natural isomorphism of functors transports effectivity at the same `(R, I)`. -/
theorem IsEffective.transport {G : CommRingCat.{u} ⥤ Type u} (e : F ≅ G)
    (h : IsEffective F R I) : IsEffective G R I := sorry

/-- `EffectivityTests.zeroIdeal`: along `I = 0` the quotients are `R` and every functor is
effective. -/
example : IsEffective F R (⊥ : Ideal R) := sorry

/-- `EffectivityTests.emptyScheme`: for `F = Hom(ℤ/1, −)`, `R = ℚ` and `I = ⊤` every quotient is
the zero ring with its unique point, giving a formal point, but `F(ℚ)` is empty. -/
example : ¬ IsEffective
    (coyoneda.obj (Opposite.op (CommRingCat.of (ZMod 1)))) ℚ (⊤ : Ideal ℚ) := sorry

variable (k : Type u) [Field k]

/-- The tangent fibre of `F` at a point `x` over a field: the dual-number points restricting to
`x`, not all dual-number points. -/
def TangentFiber (x : F.obj (CommRingCat.of k)) :=
  { y : F.obj (CommRingCat.of (TrivSqZeroExt k k)) //
    F.map (CommRingCat.ofHom (TrivSqZeroExt.fstHom k k k).toRingHom) y = x }

/-- The split tangent vector at `x`: the image of `x` under `k → k[ε]`. -/
def TangentFiber.zero (x : F.obj (CommRingCat.of k)) : TangentFiber F k x :=
  ⟨F.map (CommRingCat.ofHom (TrivSqZeroExt.inlHom k k)) x, by
    rw [← Functor.map_comp_apply]
    have : CommRingCat.ofHom (TrivSqZeroExt.inlHom k k) ≫
        CommRingCat.ofHom (TrivSqZeroExt.fstHom k k k).toRingHom = 𝟙 _ := by
      ext a
      simp
    rw [this, Functor.map_id_apply]⟩

/-- A natural transformation `F ⟶ G` maps tangent fibres to tangent fibres. -/
def TangentFiber.map {G : CommRingCat.{u} ⥤ Type u} (η : F ⟶ G)
    (x : F.obj (CommRingCat.of k)) : TangentFiber F k x → TangentFiber G k (η.app _ x) :=
  fun y => ⟨η.app _ y.val, by rw [← NatTrans.naturality_apply, y.property]⟩

/-- `TangentTests.affineLine`: the tangent fibre of the affine line at `x` is `k`, through the
`ε`-coefficient. -/
example (x : k) : Nonempty (TangentFiber (forget CommRingCat.{u}) k x ≃ k) := sorry

/-- `TangentTests.twoElements`: the affine line over `𝔽₂` has two tangent vectors at `0`, whereas
it has four dual-number points. -/
example : Nat.card (TangentFiber (forget CommRingCat.{0}) (ZMod 2) 0) = 2 := sorry

end ArtinCriteria

namespace ArithmeticCoefficients

open scoped TensorProduct

variable (R : Type u) [CommRing R] (K M : Type u) [CommRing K] [Algebra R K]
variable [AddCommGroup M] [Module R M]

/-- Fractional coefficients modulo integral ones: `(K ⊗_R M) / (1 ⊗ M)`, the coefficient module
`M ⊗ K/O` of the boundary comparisons. -/
abbrev KOCoefficients :=
  (K ⊗[R] M) ⧸ LinearMap.range (TensorProduct.mk R K M 1)

/-- The class of a fractional tensor. -/
def KOCoefficients.mk (z : K ⊗[R] M) : KOCoefficients R K M :=
  (LinearMap.range (TensorProduct.mk R K M 1)).mkQ z

/-- The class of an integral tensor `1 ⊗ m` vanishes. -/
theorem KOCoefficients.integral_zero (m : M) :
    KOCoefficients.mk R K M (1 ⊗ₜ[R] m) = 0 := sorry

/-- The class map is additive. -/
theorem KOCoefficients.mk_add (z w : K ⊗[R] M) :
    KOCoefficients.mk R K M (z + w) =
      KOCoefficients.mk R K M z + KOCoefficients.mk R K M w := sorry

/-- Every class has a fractional representative. -/
theorem KOCoefficients.mk_surjective :
    Function.Surjective (KOCoefficients.mk R K M) := sorry

/-- The universal property of the quotient: a linear map killing every integral tensor
`1 ⊗ m` factors through the coefficient module. -/
def KOCoefficients.lift {N : Type u} [AddCommGroup N] [Module R N]
    (f : K ⊗[R] M →ₗ[R] N) (hf : ∀ m : M, f (1 ⊗ₜ[R] m) = 0) :
    KOCoefficients R K M →ₗ[R] N :=
  (LinearMap.range (TensorProduct.mk R K M 1)).liftQ f (by
    rintro _ ⟨m, rfl⟩
    exact hf m)

/-- The induced map on the class of `z` is `f z`. -/
theorem KOCoefficients.lift_mk {N : Type u} [AddCommGroup N] [Module R N]
    (f : K ⊗[R] M →ₗ[R] N) (hf : ∀ m : M, f (1 ⊗ₜ[R] m) = 0) (z : K ⊗[R] M) :
    KOCoefficients.lift R K M f hf (KOCoefficients.mk R K M z) = f z := sorry

/-- Linear maps out of the coefficient module agreeing on all classes are equal. -/
theorem KOCoefficients.hom_ext {N : Type u} [AddCommGroup N] [Module R N]
    {f g : KOCoefficients R K M →ₗ[R] N}
    (h : ∀ z : K ⊗[R] M, f (KOCoefficients.mk R K M z) =
      g (KOCoefficients.mk R K M z)) : f = g := sorry

/-- A linear map `M → N` induces the map of coefficient modules `id_K ⊗ f`. -/
def KOCoefficients.map {N : Type u} [AddCommGroup N] [Module R N] (f : M →ₗ[R] N) :
    KOCoefficients R K M →ₗ[R] KOCoefficients R K N :=
  KOCoefficients.lift R K M
    (((LinearMap.range (TensorProduct.mk R K N 1)).mkQ).comp
      (TensorProduct.map (LinearMap.id : K →ₗ[R] K) f))
    (fun m => (Submodule.Quotient.mk_eq_zero _).mpr ⟨f m, rfl⟩)

/-- The induced map on classes is `mk ∘ (id_K ⊗ f)`. -/
theorem KOCoefficients.map_mk {N : Type u} [AddCommGroup N] [Module R N]
    (f : M →ₗ[R] N) (z : K ⊗[R] M) :
    KOCoefficients.map R K M f (KOCoefficients.mk R K M z) =
      KOCoefficients.mk R K N (TensorProduct.map (LinearMap.id : K →ₗ[R] K) f z) := sorry

/-- The identity induces the identity. -/
theorem KOCoefficients.map_id :
    KOCoefficients.map R K M (LinearMap.id : M →ₗ[R] M) = LinearMap.id := sorry

/-- The induced maps compose. -/
theorem KOCoefficients.map_comp {N P : Type u}
    [AddCommGroup N] [Module R N] [AddCommGroup P] [Module R P]
    (f : M →ₗ[R] N) (g : N →ₗ[R] P) :
    KOCoefficients.map R K M (g.comp f) =
      (KOCoefficients.map R K N g).comp (KOCoefficients.map R K M f) := sorry

/-- `KOTests.halfIntegralNonzero`: for `R = ℤ`, `K = ℚ` and `M = ℤ`, the class of `½ ⊗ 1` is
nonzero; the quotient is not defined to be zero. -/
example : KOCoefficients.mk ℤ ℚ ℤ ((1 / 2 : ℚ) ⊗ₜ[ℤ] (1 : ℤ)) ≠ 0 := sorry

/-- `KOTests.baseField`: for `K = R` every coefficient class is zero. -/
example (z : KOCoefficients R R M) : z = 0 := sorry

/-- Boundary duality: if `n ≥ 1`, `J^n ⊆ I B` and `c ∈ J^(n−1)`, then for every `A`-linear
`ℓ : B → A` the functional `b ↦ ℓ (c b)` sends `J` into `I`, so it lies in Mathlib's
`Submodule.compatibleMaps` and induces `B/J → A/I` by `Submodule.mapQLinear`. -/
theorem boundaryDual_mulInput {A B : Type u} [CommRing A] [CommRing B] [Algebra A B]
    (I : Ideal A) (J : Ideal B) (n : ℕ) (hn : 1 ≤ n)
    (hJ : J ^ n ≤ I.map (algebraMap A B)) (c : B) (hc : c ∈ J ^ (n - 1)) (ℓ : B →ₗ[A] A) :
    ℓ ∘ₗ LinearMap.mulLeft A c ∈ Submodule.compatibleMaps (J.restrictScalars A) I := sorry

/-- `BoundaryTests.dualNumbers`: on `ℚ[ε]` with `J = (ε)` and `I = 0`, the `ε`-coefficient
functional sends `ε` to `1`, so it is not compatible with `(J, I)`. -/
example :
    TrivSqZeroExt.sndHom ℚ ℚ ∉ Submodule.compatibleMaps
      ((RingHom.ker (TrivSqZeroExt.fstHom ℚ ℚ ℚ).toRingHom).restrictScalars ℚ) (⊥ : Ideal ℚ) :=
  sorry

variable {F₀ E₀ L₀ : Type u} [Field F₀] [Field E₀] [Field L₀]
variable [Algebra F₀ E₀] [Algebra F₀ L₀]

/-- The coefficients of a monic polynomial over `F₀` lie in a valuation ring `V` of `F₀` when all
its roots, in a splitting extension, lie in a valuation ring `W` above `V`. Repeated roots are
retained. -/
theorem root_coefficient_descent
    (V : ValuationSubring F₀) (W : ValuationSubring L₀)
    (hW : W.comap (algebraMap F₀ L₀) = V)
    (p : Polynomial F₀) (hp : p.Monic)
    (hs : (p.map (algebraMap F₀ L₀)).Splits)
    (hr : ∀ z ∈ (p.map (algebraMap F₀ L₀)).roots, z ∈ W) :
    ∀ n : ℕ, p.coeff n ∈ V := sorry

/-- The integral closure of an intersection `B₀` of valuation rings of `F₀` in a finite extension
`E₀` consists of the elements lying in every valuation ring of `E₀` above one of them. -/
theorem valuation_prolongation_integrality
    [FiniteDimensional F₀ E₀] {ι : Type u}
    (V : ι → ValuationSubring F₀) (B₀ : Subring F₀)
    [Algebra B₀ E₀] [IsScalarTower B₀ F₀ E₀]
    (hB : B₀ = ⨅ i, (V i).toSubring) (x : E₀) :
    x ∈ integralClosure B₀ E₀ ↔
      ∀ i (W : ValuationSubring E₀),
        W.comap (algebraMap F₀ E₀) = V i → x ∈ W := sorry

end ArithmeticCoefficients

namespace RelativePicard

open AlgebraicGeometry Limits TauCeti.AlgebraicGeometry

variable {X B : Scheme.{u}} (f : X ⟶ B)

/-- The relative Picard presheaf of `f : X → B` on schemes over `B`: `T ↦ Pic(X_T)` with
`X_T = T ×_B X`, acting by pullback along the induced maps of base changes. Its fppf
sheafification is the relative Picard sheaf `Pic_{X/B}` (README §7.3). -/
noncomputable def relativePicardPresheaf : (Over B)ᵒᵖ ⥤ Type (u + 1) where
  obj T := LineBundleClass (pullback T.unop.hom f)
  map {T T'} φ := TypeCat.ofHom (LineBundleClass.pullback
    (pullback.map T'.unop.hom f T.unop.hom f φ.unop.left (𝟙 X) (𝟙 B)
      (by simp) (by simp)))
  map_id T := by
    ext a
    simp
  map_comp φ ψ := by
    ext a
    simp only [TypeCat.Fun.toFun_apply, TypeCat.ofHom_apply, types_comp_apply,
      LineBundleClass.pullback_comp]
    congr 1
    ext <;> simp

/-- For the identity family `B → B` the relative Picard presheaf is the raw Picard group of each
test scheme, before sheafification kills these classes. -/
theorem relativePicardPresheaf_id_obj (T : (Over B)ᵒᵖ) :
    Nonempty ((relativePicardPresheaf (𝟙 B)).obj T ≃ LineBundleClass T.unop.left) := sorry

/-- `PicardPresheafChecks.field`: every line bundle on the spectrum of a field is trivial. -/
example (K : Type u) [Field K] :
    Subsingleton (LineBundleClass (Spec (CommRingCat.of K))) := sorry

end RelativePicard

/-! ## Layer 9: resolution and SNC compactification -/

namespace Resolution

variable {R : Type u} [CommRing R]

open scoped Classical in
/-- The order of an ideal at a prime: the largest `n` with `I R_𝔭 ⊆ 𝔭ⁿ R_𝔭`, in `ℕ∞`. Vanishing
implies order `⊤`; the converse needs Noetherianity (Krull intersection). -/
noncomputable def idealOrderAt (I : Ideal R) (p : PrimeSpectrum R) : ℕ∞ :=
  ⨆ n : ℕ, if I.map (algebraMap R (Localization.AtPrime p.asIdeal)) ≤
    (IsLocalRing.maximalIdeal (Localization.AtPrime p.asIdeal)) ^ n then (n : ℕ∞) else 0

/-- `IdealOrderChecks.unit`: the unit ideal has order zero at every prime. -/
example (p : PrimeSpectrum R) : idealOrderAt (⊤ : Ideal R) p = 0 := sorry

/-- `OrderTests.dualNumbers`: on the dual numbers the maximal ideal has order one but its square,
which is zero, has order `⊤`; the order is not multiplicative off regular rings. -/
example (K : Type u) [Field K] :
    let m := IsLocalRing.maximalIdeal (DualNumber K)
    ∃ p : PrimeSpectrum (DualNumber K), idealOrderAt m p = 1 ∧ idealOrderAt (m ^ 2) p = ⊤ :=
  sorry

/-- A marked ideal `(I, d)`: an ideal with a strictly positive mark. -/
structure MarkedIdeal (R : Type u) [CommRing R] where
  /-- The ideal whose order is compared with the mark. -/
  ideal : Ideal R
  /-- The order threshold. -/
  mark : ℕ
  /-- The threshold is strictly positive. -/
  mark_pos : 0 < mark

/-- The cosupport of a marked ideal: the primes at which the order of `I` is at least `d`. -/
def MarkedIdeal.cosupport (J : MarkedIdeal R) : Set (PrimeSpectrum R) :=
  {p | (J.mark : ℕ∞) ≤ idealOrderAt J.ideal p}

/-- A residual factor of order zero along the cosupport is the unit ideal on its open
complement of vanishing. This open contains the cosupport, and the ideal equals its other
factor at every stalk there. -/
theorem MarkedIdeal.residualUnitOnOpen (J : MarkedIdeal R) (M N : Ideal R)
    (hfactor : J.ideal = M * N)
    (hresidual : ∀ p ∈ J.cosupport, idealOrderAt N p = 0) :
    ∃ U : TopologicalSpace.Opens (PrimeSpectrum R),
      J.cosupport ⊆ (U : Set (PrimeSpectrum R)) ∧
      (U : Set (PrimeSpectrum R)) = (PrimeSpectrum.zeroLocus (N : Set R))ᶜ ∧
      ∀ p : PrimeSpectrum R, p ∈ U →
        N.map (algebraMap R (Localization.AtPrime p.asIdeal)) = ⊤ ∧
        J.ideal.map (algebraMap R (Localization.AtPrime p.asIdeal)) =
          M.map (algebraMap R (Localization.AtPrime p.asIdeal)) := sorry

/-- `CompanionChecks.locallyMonomial`: for `(x²(x−1), 2)` with boundary `x = 0`, the cosupport
is `{0}` and the residual factor `(x−1)` has order zero there. The ideal equals `(x²)` on
`D(x−1)`, while at `1` its order is one and the residual factor is nonunit globally. -/
example :
    let I : Ideal (Polynomial ℚ) := Ideal.span {Polynomial.X ^ 2 * (Polynomial.X - 1)}
    let M : Ideal (Polynomial ℚ) := Ideal.span {Polynomial.X ^ 2}
    let N : Ideal (Polynomial ℚ) := Ideal.span {Polynomial.X - 1}
    let J := MarkedIdeal.mk I 2 (by decide)
    let p₀ : PrimeSpectrum (Polynomial ℚ) :=
      PrimeSpectrum.comap (Polynomial.evalRingHom (0 : ℚ)) ⟨⊥, inferInstance⟩
    let p₁ : PrimeSpectrum (Polynomial ℚ) :=
      PrimeSpectrum.comap (Polynomial.evalRingHom (1 : ℚ)) ⟨⊥, inferInstance⟩
    I = M * N ∧ J.cosupport = {p₀} ∧ idealOrderAt N p₀ = 0 ∧
      idealOrderAt I p₁ = 1 ∧ N ≠ ⊤ ∧ I ≠ M ∧
      ∀ p : PrimeSpectrum (Polynomial ℚ), p ∈ PrimeSpectrum.basicOpen (Polynomial.X - 1) →
        I.map (algebraMap (Polynomial ℚ) (Localization.AtPrime p.asIdeal)) =
          M.map (algebraMap (Polynomial ℚ) (Localization.AtPrime p.asIdeal)) := sorry

/-- On a ring with regular local rings, `(I, d)` and `(Iᵏ, k d)` have the same cosupport. This is
the affine shadow of the test equivalence `markedIdeal_rescale` of README §9.1, which also asks for
equal cosupports after every permitted sequence of blowups and is a README target. -/
theorem MarkedIdeal.cosupport_pow (J : MarkedIdeal R) (k : ℕ) (hk : 0 < k)
    (hreg : ∀ p : PrimeSpectrum R, IsRegularLocalRing (Localization.AtPrime p.asIdeal)) :
    (MarkedIdeal.mk (J.ideal ^ k) (k * J.mark) (Nat.mul_pos hk J.mark_pos)).cosupport =
      J.cosupport := sorry

/-- `CompanionChecks.dualNumbers`: without regularity `cosupport_pow` fails: on the dual numbers
`(m, 2)` and `(m², 4)` have different cosupports. -/
example (K : Type u) [Field K] :
    let m := IsLocalRing.maximalIdeal (DualNumber K)
    (MarkedIdeal.mk (m ^ 2) 4 (by decide)).cosupport ≠
      (MarkedIdeal.mk m 2 (by decide)).cosupport := sorry

/-- The marked sum `(I, a) + (J, b) = (I^b + J^a, a b)`. -/
def MarkedIdeal.markedSum (J K : MarkedIdeal R) : MarkedIdeal R :=
  ⟨J.ideal ^ K.mark ⊔ K.ideal ^ J.mark, J.mark * K.mark,
    Nat.mul_pos J.mark_pos K.mark_pos⟩

/-- The mark of a marked sum is the product of the marks. -/
theorem MarkedIdeal.markedSum_mark (J K : MarkedIdeal R) :
    (J.markedSum K).mark = J.mark * K.mark := rfl

/-- Each summand is raised to the mark of the other. -/
theorem MarkedIdeal.markedSum_ideal (J K : MarkedIdeal R) :
    (J.markedSum K).ideal = J.ideal ^ K.mark ⊔ K.ideal ^ J.mark := rfl

/-- On a ring with regular local rings, the cosupport of a marked sum is the intersection of the
cosupports. -/
theorem MarkedIdeal.markedSum_cosupport
    (hreg : ∀ p : PrimeSpectrum R,
      IsRegularLocalRing (Localization.AtPrime p.asIdeal)) (J K : MarkedIdeal R) :
    (J.markedSum K).cosupport = J.cosupport ∩ K.cosupport := sorry

/-- `CompanionChecks.unit`: with positive marks on regular localizations, a unit summand gives
the unit ideal and empty cosupport. -/
example (J : MarkedIdeal R) (d : ℕ) (hd : 0 < d)
    (hreg : ∀ p : PrimeSpectrum R, IsRegularLocalRing (Localization.AtPrime p.asIdeal)) :
    let K := MarkedIdeal.mk (⊤ : Ideal R) d hd
    (K.markedSum J).ideal = ⊤ ∧ (K.markedSum J).cosupport = ∅ := sorry

/-- `CompanionChecks.zero`: with positive marks on regular localizations, two zero ideals give
the zero ideal and full cosupport with their positive product mark. -/
example (a b : ℕ) (ha : 0 < a) (hb : 0 < b)
    (hreg : ∀ p : PrimeSpectrum R, IsRegularLocalRing (Localization.AtPrime p.asIdeal)) :
    let J := MarkedIdeal.mk (⊥ : Ideal R) a ha
    let K := MarkedIdeal.mk (⊥ : Ideal R) b hb
    (J.markedSum K).ideal = ⊥ ∧ (J.markedSum K).cosupport = Set.univ ∧
      (J.markedSum K).mark = a * b := sorry

/-- `CompanionChecks.marks`: the marked sum of `(y², 2)` and `(x³, 2)` is `((y⁴, x⁶), 4)`, not the
unpowered sum. -/
example :
    let J := MarkedIdeal.mk
      (Ideal.span {MvPolynomial.X (1 : Fin 2) ^ 2} : Ideal (MvPolynomial (Fin 2) ℚ)) 2 (by decide)
    let K := MarkedIdeal.mk
      (Ideal.span {MvPolynomial.X (0 : Fin 2) ^ 3} : Ideal (MvPolynomial (Fin 2) ℚ)) 2 (by decide)
    (J.markedSum K).mark = 4 ∧
      (J.markedSum K).ideal =
        (Ideal.span {MvPolynomial.X (1 : Fin 2) ^ 4, MvPolynomial.X (0 : Fin 2) ^ 6} :
          Ideal (MvPolynomial (Fin 2) ℚ)) := sorry

/-- Upper semicontinuity of the order on a regular ring of finite type over a field of
characteristic zero (an affine chart of a smooth variety): the cosupport of a marked ideal is
closed. -/
theorem MarkedIdeal.isClosed_cosupport (k : Type u) [Field k] [CharZero k] [Algebra k R]
    [Algebra.FiniteType k R]
    (hreg : ∀ p : PrimeSpectrum R, IsRegularLocalRing (Localization.AtPrime p.asIdeal))
    (J : MarkedIdeal R) : IsClosed J.cosupport := sorry

/-- The unit marked ideal has empty cosupport. -/
example (d : ℕ) (hd : 0 < d) : (MarkedIdeal.mk (⊤ : Ideal R) d hd).cosupport = ∅ := sorry

variable {k : Type u} [Field k] {σ : Type u}

/-- The derivative ideal `D(I) = I + (∂f/∂xᵢ : f ∈ I)` of an ideal of a polynomial ring. -/
noncomputable def derivativeIdeal (I : Ideal (MvPolynomial σ k)) : Ideal (MvPolynomial σ k) :=
  I ⊔ Ideal.span {g | ∃ f ∈ I, ∃ i : σ, g = MvPolynomial.pderiv i f}

/-- `DerivativeIdealChecks.cubic`: in characteristic zero the derivative ideal of `(x³)` is
`(x²)`. -/
example : derivativeIdeal (Ideal.span
    {((MvPolynomial.X () : MvPolynomial Unit ℚ) ^ 3)}) =
      Ideal.span {((MvPolynomial.X () : MvPolynomial Unit ℚ) ^ 2)} := sorry

/-- `MaxContactTests.characteristicTwoPower`: in characteristic two the derivative ideal of `(x²)`
is `(x²)` itself, so derivatives give no hypersurface of maximal contact. -/
example :
    derivativeIdeal (Ideal.span
      {((MvPolynomial.X () : MvPolynomial Unit (ZMod 2)) ^ 2)}) =
      Ideal.span {((MvPolynomial.X () : MvPolynomial Unit (ZMod 2)) ^ 2)} := sorry

/-- Maximal contact in characteristic zero: if `I` has order exactly `d ≥ 1` at a prime `𝔭` of the
polynomial ring, some element of the `(d − 1)`-st derivative ideal has order exactly `1` at `𝔭`.
This fails in positive characteristic (`x^p` over `𝔽_p`). -/
theorem exists_maximalContact [CharZero k] [Finite σ] (I : Ideal (MvPolynomial σ k))
    (p : PrimeSpectrum (MvPolynomial σ k)) (d : ℕ) (hd : 0 < d) (hI : idealOrderAt I p = d) :
    ∃ f ∈ derivativeIdeal^[d - 1] I, idealOrderAt (Ideal.span {f}) p = 1 := sorry

open AlgebraicGeometry in
/-- Resolution of singularities in characteristic zero: an integral separated scheme of finite type
over a field of characteristic zero admits a proper surjective morphism from a smooth scheme which
is an isomorphism over a dense open subscheme. The embedded, functorial and boundary forms are
README targets (§§9.4–9.7). -/
theorem exists_resolution [CharZero k] (X : Scheme.{u}) (s : X ⟶ Spec (CommRingCat.of k))
    [LocallyOfFiniteType s] [QuasiCompact s] [IsSeparated s] [IsIntegral X] :
    ∃ (Y : Scheme.{u}) (π : Y ⟶ X), IsProper π ∧ Function.Surjective π.base ∧
      Smooth (π ≫ s) ∧ ∃ U : X.Opens, Dense (U : Set X) ∧ IsIso (π ∣_ U) := sorry

end Resolution

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

end
