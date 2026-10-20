import Mathlib
import TauCeti.AlgebraicGeometry.LineBundle.Class
import TauCeti.AlgebraicGeometry.LineBundle.Functoriality

/-!
# Algebraic moduli for arithmetic geometry: representative target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. The declarations below are suggested forms for the parts of the roadmap that can be
stated directly against the pinned Mathlib and Tau Ceti: the light definitions with real bodies,
the theorems whose every carrier exists at the pins or is one of those definitions, and a few
proved examples exhibiting their moduli and descent properties. `sorry` marks a goal, not a result.

The heavy carriers are README targets with their intended signatures and do not appear here:
projective bundles of quasi-coherent modules and their twisting sheaves, coherent Grassmannians
and flags, the quasi-coherent descent pseudofunctor, relative Hom and Weil restriction presheaves,
the intrinsic band sheaf and the Hom sheaves of banded morphisms, gerbe classes in `H²`,
finite-stage twisted-inertia pair stacks, their internal mapping-stack comparisons and stackified
filtered two-colimit (README §4.5),
rigidifications and finite correspondences of stacks, Picard stack carriers and sheaves, framed
deformation groupoids and nonarchimedean analytifications. Layer 9 consumes resolution and
marked-ideal APIs from ResolutionOfSingularitiesCharacteristicZero and specifies their algebraic
vanishing and numerical applications in the README. Layers 5, 8 and 9 have no section below.

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
-/

open CategoryTheory Opposite Bicategory

universe u v w u' v' uI vI

noncomputable section

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

/-- `hopfInclusion_faithfullyFlat` (README §4.22): an injective map of commutative Hopf algebras
makes the target faithfully flat over the source, over any field and without finite-type or
reducedness hypotheses (Milne, version 3.00, Theorem 6.43 and Corollary 8.25). -/
theorem hopfInclusion_faithfullyFlat {k : Type u} [Field k]
    {A : Type v} [CommRing A] [HopfAlgebra k A]
    {B : Type w} [CommRing B] [HopfAlgebra k B]
    (f : A →ₐc[k] B) (hf : Function.Injective f) :
    f.toAlgHom.toRingHom.FaithfullyFlat := sorry

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

/-- The zero module has no invertible quotient on a nonempty test
scheme, so `P(0)` is empty. -/
theorem noLineQuotientZero {S T : Scheme.{u}} (f : T ⟶ S) [Nonempty T] :
    IsEmpty (LineQuotient f (SheafOfModules.free (R := S.ringCatSheaf) PEmpty.{u + 1})) := sorry

/-- The exponent vectors indexing the Laurent Čech basis of `H^q(P^n_A, O(m))`: in degree `0`
the nonnegative vectors of sum `m` (every vector when `n = 0`, since `P^0_A = Spec A`), in degree
`n ≥ 1` the vectors of sum `m` with all entries negative, and nothing in other degrees. -/
def projectiveTwistBasis (n q : ℕ) (m : ℤ) : Type :=
  {e : Fin (n + 1) → ℤ // (∑ i, e i) = m ∧
    ((q = 0 ∧ (n = 0 ∨ ∀ i, 0 ≤ e i)) ∨ (0 < n ∧ q = n ∧ ∀ i, e i < 0))}

/-- On `P⁰` every integer twist has a single Laurent basis vector, including negative twists. -/
example (m : ℤ) : Nonempty (Unique (projectiveTwistBasis 0 0 m)) := by
  refine ⟨{ default := ⟨fun _ => m, by simp⟩, uniq := ?_ }⟩
  intro e
  apply Subtype.ext
  funext i
  fin_cases i
  simpa using e.property.1

/-- The finite cutoff of the coefficient-fixing Frobenius `u ↦ u^p` on coefficient vectors: the
coefficient in degree `j < N` is placed in degree `p j ≤ p N`. Every matrix entry is `0` or `1`;
the map is linear over the coefficients and does not raise them to the `p`-th power. -/
def coefficientFrobeniusCutoff (R : Type u) [CommRing R] (p N : ℕ) :
    (Fin N → R) →ₗ[R] (Fin (p * N + 1) → R) :=
  Matrix.mulVecLin (fun (i : Fin (p * N + 1)) (j : Fin N) =>
    if i.val = p * j.val then (1 : R) else 0)

/-- A coefficient `t` in degree `j` is carried unchanged to degree `p j`, including when
`t^p ≠ t` and when `p = 0` (all source exponents then have the same image). -/
theorem coefficientFrobeniusCutoff_single (R : Type u) [CommRing R] (p N : ℕ)
    (j : Fin N) (t : R) :
    coefficientFrobeniusCutoff R p N (Pi.single j t) =
      fun i => if i.val = p * j.val then t else 0 := sorry

/-- Coefficient transport along `u ↦ u^p` fixes a coefficient even when its `p`-th power differs. -/
example (p : ℕ) (R : Type u) [CommRing R] (t : R) (h : t ^ p ≠ t) :
    coefficientFrobeniusCutoff R p 1 (fun _ => t) 0 ≠ t ^ p := by
  change (∑ j : Fin 1, (if (0 : ℕ) = p * j.val then (1 : R) else 0) * t) ≠ t ^ p
  simpa using h.symm

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

/-- A band with trivial sections forces the corresponding object automorphisms to be trivial. -/
example (b : AbelianBanding F J A) (U : C)
    [Subsingleton (A.obj.obj (op U))] (x : F.obj (.mk (op U))) :
    ∀ a : Aut x, a = 1 := by
  have : Subsingleton (Aut x) := (b.autEquiv U x).symm.injective.subsingleton
  intro a
  exact Subsingleton.elim a 1

/-- A neutralization over `S`: an object of the fibre over `S`. -/
structure Neutralization (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}) (S : C) where
  /-- The chosen global object. -/
  obj : F.obj (.mk (op S))

/-- Neutrality: a global object over the specified terminal object of the site. Sites without a
terminal object use the terminal sheaf of the topos (README, Conventions). -/
def IsNeutral (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}) (S : C)
    (_hS : Limits.IsTerminal S) : Prop :=
  Nonempty (Neutralization F S)

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
theorem band_morphism_componentEquivalence
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

/-- On the one-object discrete index the compatible families are
equivalent to the single stage, for any unit data of `Φ`. -/
theorem singletonEquivalence (Φ : LocallyDiscrete (Discrete PUnit) ⥤ᵖ Cat.{v', u'}) :
    Nonempty (GerbeLimitFamily Φ ≌ Φ.obj (.mk (Discrete.mk PUnit.unit))) := sorry

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
/-- `IntrinsicBandSections.evalEquiv` (README §§4.6a, 4.21): evaluation of compatible central
sections at an object is bijective for a gerbe with abelian automorphism groups.
The evaluation uses the identity slice arrow (Stacks, tag 0CJY, with Hom-sheaf descent). -/
theorem intrinsicBandSection_evaluation_bijective
    (hComm : ∀ (V : C) (y : F.obj (.mk (op V))) (a b : Aut y), a * b = b * a)
    (U : C) (x : F.obj (.mk (op U))) :
    Function.Bijective (fun s : IntrinsicBandSection F U =>
      (Aut.unitsEndEquivAut (𝟭 (F.obj (.mk (op U)))) (s.val U (𝟙 U))).app x) := sorry

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

end Approximation

/-! ## Layer 7: space Picard, Artin representability and arithmetic coefficients -/

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

/-- Direct image of subsets: a functor of points that fails (RS). -/
def StrongGluingTests.subsetImage : CommRingCat.{u} ⥤ Type u where
  obj R := Set R
  map f := TypeCat.ofHom (Set.image f)
  map_id R := by ext s x; simp
  map_comp f g := by ext s x; simp

/-- `StrongGluingTests.subsetFailure`: for both maps `ℚ[ε] → ℚ`, the diagonal subset and the whole
pullback have the same two projections but differ, so the comparison is not injective even along a
square-zero surjection. -/
theorem StrongGluingTests.subsetFailure : ¬ StrongInfinitesimalGluing StrongGluingTests.subsetImage.{0} := sorry

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

/-- `FormalPointTests.firstOrderInsufficient`: on `ℚ[t]/(t³)` with `I = (t)`, the points `0` and
`t²` agree modulo `I` and modulo `I²` but not modulo `I³ = 0`; the residue together with the
first-order jet does not determine a formal point. -/
theorem FormalPointTests.firstOrderInsufficient :
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

/-- `EffectivityTests.emptyScheme`: for `F = Hom(ℤ/1, −)`, `R = ℚ` and `I = ⊤` every quotient is
the zero ring with its unique point, giving a formal point, but `F(ℚ)` is empty. -/
theorem EffectivityTests.emptyScheme : ¬ IsEffective
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

/-- Boundary duality: if `n ≥ 1`, `J^n ⊆ I B` and `c ∈ J^(n−1)`, then for every `A`-linear
`ℓ : B → A` the functional `b ↦ ℓ (c b)` sends `J` into `I`, so it lies in Mathlib's
`Submodule.compatibleMaps` and induces `B/J → A/I` by `Submodule.mapQLinear`. -/
theorem boundaryDual_mulInput {A B : Type u} [CommRing A] [CommRing B] [Algebra A B]
    (I : Ideal A) (J : Ideal B) (n : ℕ) (hn : 1 ≤ n)
    (hJ : J ^ n ≤ I.map (algebraMap A B)) (c : B) (hc : c ∈ J ^ (n - 1)) (ℓ : B →ₗ[A] A) :
    ℓ ∘ₗ LinearMap.mulLeft A c ∈ Submodule.compatibleMaps (J.restrictScalars A) I := sorry

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

end RelativePicard

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

end
