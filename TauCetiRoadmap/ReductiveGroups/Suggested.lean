import Mathlib
import TauCeti.Algebra.AlgebraicGroup.LinearlyReductive
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.Algebra.AlgebraicGroup.Torus.Basic
import TauCeti.Algebra.AlgebraicGroup.Torus.Maximal
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Conjugation
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Coinvariants.Basic
import TauCeti.Algebra.AlgebraicGroup.Unipotent.Radical.Construction
import TauCeti.Algebra.Lie.UniversalEnveloping.Kostant.Form
import TauCeti.GroupTheory.SpecificGroups.Braid.Basic

/-!
# Reductive algebraic groups: target signatures

The roadmap is README.md; this file is not the roadmap. It states headline theorems
against the pinned APIs: local closedness of algebraic orbits, strict dimension drop
at the boundary, closed orbits in orbit closures, the character kernel of central-cover lifts, and integral PBW for the full
reductive Chevalley frame (including its central torus), compactness of proper complex
scheme points, characteristic-zero equivalence of reductivity and complete reducibility,
Nagata's characteristic-`p` criterion that a smooth connected affine group is linearly
reductive exactly when it is a torus, the characteristic-zero Levi complement of §6A in
Hopf coordinates, conjugacy of maximal tori by rational points over an algebraically closed
field, Lang surjectivity over finite fields,
and nonsplitting of the braid permutation extension for at least two strands.

Conjugacy of Borel subgroups over an algebraically closed field (§7.1) is proved in the
pinned Tau Ceti, `TauCeti.HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq` in
`TauCeti/Algebra/AlgebraicGroup/Borel/Conjugacy/Existence.lean`, and is consumed, not restated.

The signed ADE integral Lie construction and its full-lattice comparison lack the
constructed signed root-space Lie algebra and its Chevalley-frame identification.
The pinned fixed-Lie folding classification lacks that Lie algebra with its pinned
diagram action, integral fixed lattice and normalized folded root datum. Native
fixed-subalgebra and Serre-presentation carriers alone do not identify these objects.
The general pinned integral model and its change-of-choice theorem lack the bundled
relative split reductive group with prescribed full root datum and pinning.
Relative structure and base-change comparisons lack the constructed relative center,
derived subgroup, maximal-torus and Borel schemes. Affineness of quotients of affine
algebraic groups by closed subgroups with reductive identity component over an
algebraically closed characteristic-zero field lacks the constructed homogeneous
quotient and its invariant-coordinate comparison. The
highest-weight classification lacks the rational highest-weight modules and their
identification with the prescribed integral model. The spectral monodromy theorem
lacks the constructed regular-semisimple quotient and its analytic comparison on
the native group-point carrier. The full smooth-chart comparison lacks the compatible manifold atlas on native
scheme points; this is a construction of README §3A.5. The scheme semidirect-product
form `U ⋊ L ≃ G` of the Levi decomposition of §6A lacks the constructed semidirect-product
group scheme; its Hopf-coordinate form, that the quotient by a Hopf ideal restricts to an
isomorphism from the coinvariants of the unipotent radical's defining ideal, is stated below.
The existence of Levi complements of parabolic `k`-subgroups of §7.2 lacks a parabolic
predicate on Hopf ideals of a given group: the pinned dynamic parabolic of a cocharacter is a
subgroup functor of points whose representability is not addressed. The Bruhat decomposition
`B(k)\G(k)/B(k) ≃ W` of §7.3 lacks the root subgroups and the Weyl group `N_G(T)/T` of a given
split group with its root datum: the pinned root subgroups, Weyl groups and Bruhat decompositions
belong to specific carriers (`GL_n`, `SL_n`, `Sp_2n`, and the Chevalley-type group schemes built
from Kostant forms, such as the Geck and E₆ minuscule carriers) and to an abstract Tits system,
none of them attached to an arbitrary split group with its root datum.
The Harish–Chandra biadjunctions, Mackey
decomposition and common-Levi independence of §§7c–7e, including their Steinberg
endomorphism extensions in §7g, lack the constructed
Frobenius-fixed parabolic and Levi groups with their Harish–Chandra functors.
The distribution comparison, Frobenius-kernel and contraction theorems of §9C
lack the algebra of identity-supported distributions of the constructed integral
group, its relative Frobenius map and the rational contracted-module construction.
The Weyl/simple-module and Steinberg-module endpoints of §10 lack their
rational highest-weight module constructions as well.
These endpoints remain in
the README; no surrogate constructor or arbitrary maps are assumed here.
-/

open CategoryTheory MonoidalCategory CartesianMonoidalCategory AlgebraicGeometry
open scoped CategoryTheory.MonObj
open Topology

attribute [local instance] CategoryTheory.Over.cartesianMonoidalCategory

namespace TauCetiRoadmap.ReductiveGroups

/-! ## Layer 3A: algebraic orbits and their boundaries -/

namespace AlgebraicOrbits
noncomputable section
universe u

/-- Rational points of a scheme over the base, as morphisms from the terminal object. -/
abbrev Points {C : Type*} [Category C] [CartesianMonoidalCategory C] (X : C) :=
  (𝟙_ C ⟶ X)

variable {k : Type u} [Field k]
variable (G X : Over (Spec (CommRingCat.of k))) [GrpObj G] [ModObj G X]

/-- The orbit map sends a group element to its action on the specified rational point. -/
def orbitMorphism (x : Points X) : G ⟶ X :=
  lift (𝟙 G) (toUnit G ≫ x) ≫ γ[G, X]

/-- The geometric orbit is the image of the orbit morphism on the underlying spaces. -/
def geometricOrbit (x : Points X) : Set X.left :=
  Set.range fun z : G.left => (orbitMorphism G X x).left z

/-- The orbit closure in the Zariski topology of the action scheme. -/
def orbitClosure (x : Points X) : Set X.left := closure (geometricOrbit G X x)

/-- The orbit boundary is its closure minus the orbit. -/
def orbitBoundary (x : Points X) : Set X.left :=
  orbitClosure G X x \ geometricOrbit G X x

/-- Krull dimension of the orbit with its subspace topology; the empty space has bottom dimension. -/
noncomputable def orbitDimension (x : Points X) : WithBot ℕ∞ :=
  topologicalKrullDim (geometricOrbit G X x)

/-- Orbits of smooth affine finite-type groups are locally closed (Milne 2017, Proposition 1.65). -/
theorem orbit_locallyClosed
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x : Points X) :
    IsLocallyClosed (geometricOrbit G X x) := by sorry

/-- The boundary has strictly smaller dimension, also for disconnected groups (Milne 2017, proof of Proposition 1.66, componentwise). -/
theorem boundary_dimension_lt
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x : Points X) :
    topologicalKrullDim (orbitBoundary G X x) < orbitDimension G X x := by sorry

/-- Each orbit closure contains a closed orbit (Milne 2017, Proposition 1.66). -/
theorem exists_closed_orbit_in_closure
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x : Points X) :
    ∃ y : Points X, IsClosed (geometricOrbit G X y) ∧
      geometricOrbit G X y ⊆ orbitClosure G X x := by sorry

/-- A nonempty finite-type action scheme has a closed orbit (Milne 2017, Proposition 1.66). -/
theorem exists_closed_orbit
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (hx : Nonempty (Points X)) :
    ∃ y : Points X, IsClosed (geometricOrbit G X y) := by sorry

end
end AlgebraicOrbits

/-! ## Layer 3A: proper complex points -/

namespace ClassicalPoints

/-- Evaluation of a global regular function at a complex scheme point. -/
noncomputable def affinePointEval (Y : Over (Spec (CommRingCat.of ℂ)))
    (y : AlgebraicOrbits.Points Y) (f : Γ(Y.left, ⊤)) : ℂ :=
  (Scheme.ΓSpecIso (CommRingCat.of ℂ)).hom.hom (y.left.appTop.hom f)

/-- Classical subbasic opens are regular-function inverse images in affine open charts. -/
def classicalPointSubbasis (X : Over (Spec (CommRingCat.of ℂ))) :
    Set (Set (AlgebraicOrbits.Points X)) :=
  {U | ∃ (Y : Over (Spec (CommRingCat.of ℂ))) (j : Y ⟶ X),
    IsOpenImmersion j.left ∧ IsAffine Y.left ∧
    ∃ (f : Γ(Y.left, ⊤)) (W : Set ℂ), IsOpen W ∧
      U = {x | ∃ y : AlgebraicOrbits.Points Y,
        y ≫ j = x ∧ affinePointEval Y y f ∈ W}}

/-- The classical topology on complex points, generated by affine regular-function charts. -/
@[instance_reducible] def classicalPointTopology
    (X : Over (Spec (CommRingCat.of ℂ))) : TopologicalSpace (AlgebraicOrbits.Points X) :=
  TopologicalSpace.generateFrom (classicalPointSubbasis X)

/-- A proper complex scheme has compact classical points (SGA 1 XII, Proposition 3.2(v)). -/
theorem compact_complexPoints (X : Over (Spec (CommRingCat.of ℂ)))
    [IsProper X.hom] :
    @CompactSpace (AlgebraicOrbits.Points X) (classicalPointTopology X) := by
  sorry

end ClassicalPoints

/-! ## Layer 6: characteristic-zero complete reducibility -/

/-- A smooth geometrically connected affine group of finite type over a characteristic-zero
field is reductive if and only if every finite-dimensional rational representation is
completely reducible (Milne 2017, Theorem 22.42, pp. 477–478). -/
theorem reductive_iff_linearlyReductive (k : Type u) [Field k] [CharZero k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k)
    (hsmooth : Algebra.Smooth k H)
    (hconnected : TauCeti.geometricallyConnectedCommHopfAlgProperty k H.obj) :
    TauCeti.reductiveCommHopfAlgProperty k H ↔
      TauCeti.linearlyReductiveCommHopfAlgProperty k H.obj := by
  sorry

/-- Nagata's theorem. Over a field of characteristic `p > 0`, a smooth geometrically
connected affine group of finite type is linearly reductive if and only if it is a torus,
where a torus means a group that becomes a split torus over an algebraic closure
(Milne 2017, Remark 12.56, p. 249, with the footnote to Proposition 12.54, p. 248: linear
reductivity is insensitive to extension of the base field). Smoothness is needed: `μ_p` is
connected and linearly reductive but not a torus. Geometric connectedness is needed: the
constant group `ℤ/ℓ` for a prime `ℓ ≠ p` is linearly reductive and not a torus. -/
theorem linearlyReductive_iff_torus (k : Type u) [Field k]
    (p : ℕ) [Fact p.Prime] [CharP k p]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k)
    (hsmooth : Algebra.Smooth k H)
    (hconnected : TauCeti.geometricallyConnectedCommHopfAlgProperty k H.obj) :
    TauCeti.linearlyReductiveCommHopfAlgProperty k H.obj ↔
      TauCeti.torusCommHopfAlgProperty k H := by
  sorry

/-! ## Layer 6A: characteristic-zero Levi complements -/

namespace LeviComplements

/-- Mostow's theorem in Hopf coordinates. Over a field `k` of characteristic zero, a smooth
geometrically connected affine group `G` of finite type has a Levi complement: a closed
subgroup `L` on which the quotient map `q : G → Q = G/R_u(G)` restricts to an isomorphism.
With `I_u` the defining Hopf ideal of the `k`-unipotent radical (the geometric unipotent
radical, since `k` is perfect), `O(Q)` is the subalgebra of right `I_u`-coinvariants of `O(G)`,
and `L` is cut out by a Hopf ideal `J` for which the composite `O(Q) → O(G) → O(G)/J = O(L)`
is bijective (McNinch, Levi decompositions of a linear algebraic group, §3.1, p. 6). For
reductive `G` the ideal `J = 0` works; for unipotent `G` the augmentation ideal works. The
characteristic hypothesis is needed: in characteristic `p` the group of length-two Witt
vector points of `SL₂` has reductive quotient `SL₂` and no Levi complement (McNinch, (3.2.1),
p. 7). -/
theorem exists_levi_complement (k : Type u) [Field k] [CharZero k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k)
    (hsmooth : Algebra.Smooth k H)
    (hconnected : TauCeti.geometricallyConnectedCommHopfAlgProperty k H.obj) :
    ∃ J : TauCeti.HopfIdeal k H,
      Function.Bijective
        ((Ideal.Quotient.mkₐ k J.toIdeal).comp
          (TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalDefiningIdeal H).coinvariants.val) := by
  sorry

end LeviComplements

/-! ## Layer 7: maximal tori -/

namespace BorelTori

/-- Over an algebraically closed field `k`, any two maximal tori of a finite-type affine group
`G` are conjugate by a rational point: if the Hopf ideals `I` and `J` cut out maximal tori `T`
and `T'`, then `g T g⁻¹ = T'` for some `g ∈ G(k)`, that is `I.conjugate g = J` (Milne 2017,
Theorem 17.10, p. 354, for smooth connected `G`; the tori of `G` are the tori of the smooth
connected subgroup `(G_red)°`, whose rational points are rational points of `G`). The pinned
`TauCeti.HopfIdeal.exists_conjugate_eq_of_isMaximalTorus` assumes in addition that both tori
can be conjugated into a fixed maximal torus. Algebraic closedness is needed: over `ℝ` the
diagonal torus and `SO₂` are maximal tori of `SL₂` that no real point conjugates into each
other. -/
theorem exists_conjugate_eq_of_isMaximalTorus (k : Type u) [Field k] [IsAlgClosed k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k) {I J : TauCeti.HopfIdeal k H.obj}
    (hI : TauCeti.HopfIdeal.IsMaximalTorus k H.obj I)
    (hJ : TauCeti.HopfIdeal.IsMaximalTorus k H.obj J) :
    ∃ g : WithConv (H.obj →ₐ[k] k), I.conjugate g = J := by
  sorry

end BorelTori

/-! ## Layer 7a: Lang surjectivity over finite fields -/

namespace FiniteFieldPoints

/-- Lang's theorem. For a smooth geometrically connected affine group `G` of finite type over
a finite field `k` with `q` elements, and an algebraically closed extension `K` of `k`, every
`K`-point of `G` is `g⁻¹ F(g)` for some `K`-point `g`, where `F(g)` is `g` followed by the
`q`-power Frobenius of `K` (Milne 2017, Theorem 17.96 and Corollary 17.97, p. 383; the source
writes the map as `g ↦ g F(g)⁻¹`, and inverting the input converts one convention into the
other). Geometric connectedness is needed: on the constant group `ℤ/2` the map is constant
with value `1`. Algebraic closedness of `K` is needed: on `𝔾_a` over `K = k` the map
`x ↦ x^q − x` is zero. -/
theorem lang_surjective (k : Type u) [Field k] [Finite k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k)
    (hsmooth : Algebra.Smooth k H)
    (hconnected : TauCeti.geometricallyConnectedCommHopfAlgProperty k H.obj)
    (K : Type u) [Field K] [Algebra k K] [IsAlgClosed K]
    (F : K →ₐ[k] K) (hF : ∀ a : K, F a = a ^ Nat.card k) :
    Function.Surjective (fun g : WithConv (H →ₐ[k] K) =>
      g⁻¹ * WithConv.toConv (F.comp g.ofConv)) := by
  sorry

end FiniteFieldPoints

/-! ## Layer 9A: the full reductive integral enveloping form -/

namespace CoverLifts

variable {E Q A : Type*} [Group E] [Group Q] [Group A]

/-- Automorphisms of the extension fixing its kernel and covering the specified action. -/
def liftSubgroup (S : GroupExtension ℤˣ E Q) (ρ : A →* MulAut Q) :
    Subgroup (MulAut E × A) where
  carrier := {p | (∀ s, p.1 (S.inl s) = S.inl s) ∧
    ∀ e, S.rightHom (p.1 e) = ρ p.2 (S.rightHom e)}
  one_mem' := by constructor <;> intro <;> simp
  mul_mem' := by
    intro p q hp hq
    constructor
    · intro s
      change p.1 (q.1 (S.inl s)) = S.inl s
      rw [hq.1, hp.1]
    · intro e
      change S.rightHom (p.1 (q.1 e)) = ρ (p.2 * q.2) (S.rightHom e)
      rw [hp.2, hq.2, map_mul]
      rfl
  inv_mem' := by
    intro p hp
    constructor
    · intro s
      change p.1.symm (S.inl s) = S.inl s
      simpa using (congrArg p.1.symm (hp.1 s)).symm
    · intro e
      change S.rightHom (p.1.symm e) = ρ p.2⁻¹ (S.rightHom e)
      rw [map_inv]
      simpa using (congrArg (ρ p.2).symm (hp.2 (p.1.symm e))).symm

/-- The group of kernel-fixing lifts, with multiplication of the actual automorphisms. -/
abbrev LiftGroup (S : GroupExtension ℤˣ E Q) (ρ : A →* MulAut Q) := liftSubgroup S ρ

/-- The homomorphism from a lift to the element of the acting group that it covers. -/
def projection (S : GroupExtension ℤˣ E Q) (ρ : A →* MulAut Q) :
    LiftGroup S ρ →* A where
  toFun l := l.val.2
  map_one' := rfl
  map_mul' _ _ := rfl

/-- For a central extension, the kernel of the lift projection is precisely the
character group, with the specified twist action on every element of the cover. -/
theorem exists_characterKernelEquiv (S : GroupExtension ℤˣ E Q) (ρ : A →* MulAut Q)
    (hc : ∀ s e, S.inl s * e = e * S.inl s) :
    ∃ φ : (Q →* ℤˣ) ≃* (projection S ρ).ker,
      ∀ (χ : Q →* ℤˣ) (e : E), (φ χ).val.val.1 e = S.inl (χ (S.rightHom e)) * e := by
  sorry

end CoverLifts

namespace IntegralPBW
noncomputable section
variable {m r : ℕ} {X Y L : Type*}
variable [AddCommGroup X] [AddCommGroup Y]
variable [LieRing L] [LieAlgebra ℚ L]
variable (P : RootPairing (Fin m) ℤ X Y) [P.IsCrystallographic]

/-- A concrete rational realization of the full integral reductive datum.
Every field is actual data or a specified equation, not an unspecified Prop.
Finite roots and toral bases are enumerated; arbitrary finite orders transport
by reindexing. Empty root sets and rank-zero cases are included. -/
structure ReductiveChevalleyFrame where
  reduced : P.IsReduced
  toralBasis : Module.Basis (Fin r) ℤ Y
  cartan : Y →ₗ[ℤ] L
  rootVector : Fin m → L
  ambientBasis : Module.Basis (Fin r ⊕ Fin m) ℚ L
  basis_toral (j : Fin r) : ambientBasis (Sum.inl j) = cartan (toralBasis j)
  basis_root (i : Fin m) : ambientBasis (Sum.inr i) = rootVector i
  toral_commute (y z : Y) : ⁅cartan y, cartan z⁆ = 0
  toral_root (y : Y) (i : Fin m) :
    ⁅cartan y, rootVector i⁆ = ((P.toLinearMap (P.root i) y : ℤ) : ℚ) • rootVector i
  opposite_root (i j : Fin m) (hij : P.root j = -P.root i) :
    ⁅rootVector i, rootVector j⁆ = cartan (P.coroot i)
  rootConstant : Fin m → Fin m → ℤ
  root_sum (i j k : Fin m) (hijk : P.root k = P.root i + P.root j) :
    ⁅rootVector i, rootVector j⁆ = (rootConstant i j : ℚ) • rootVector k
  root_constant_size (i j k : Fin m) (hijk : P.root k = P.root i + P.root j) :
    Int.natAbs (rootConstant i j) = P.chainBotCoeff i j + 1
  root_zero (i j : Fin m) (hne : P.root i + P.root j ≠ 0)
      (hnot : ∀ k : Fin m, P.root k ≠ P.root i + P.root j) :
    ⁅rootVector i, rootVector j⁆ = 0

variable {P}

/-- Native integral subring, using every root and the full Y basis. -/
def integralSubring (D : ReductiveChevalleyFrame (r := r) (L := L) P) :
    Subring (UniversalEnvelopingAlgebra ℚ L) :=
  TauCeti.UniversalEnvelopingAlgebra.kostantForm D.rootVector
    (fun j => D.cartan (D.toralBasis j))

/-- The integral enveloping form as the carrier of its native Kostant subring. -/
abbrev IntegralForm (D : ReductiveChevalleyFrame (r := r) (L := L) P) :=
  ↥(integralSubring D)

/-- Actual native divided-power value and its native membership proof. -/
def rootDividedPower (D : ReductiveChevalleyFrame (r := r) (L := L) P)
    (i : Fin m) (a : ℕ) : IntegralForm D :=
  ⟨TauCeti.Associative.dividedPower a (UniversalEnvelopingAlgebra.ι ℚ (D.rootVector i)),
    TauCeti.UniversalEnvelopingAlgebra.dividedPower_mem_kostantForm _ _ i a⟩

attribute [local instance] TauCeti.moduleNNRat

/-- Full toral binomial, including central cocharacters. -/
def toralBinomial (D : ReductiveChevalleyFrame (r := r) (L := L) P)
    (j : Fin r) (a : ℕ) : IntegralForm D :=
  ⟨Ring.choose (UniversalEnvelopingAlgebra.ι ℚ (D.cartan (D.toralBasis j))) a,
    TauCeti.UniversalEnvelopingAlgebra.ringChoose_mem_kostantForm _ _ j a⟩

/-- Finite multi-exponents for negative roots, every toral direction, positive roots. -/
abbrev PBWExponent (base : P.Base) :=
  ({i : Fin m // ¬base.IsPos i} → ℕ) × (Fin r → ℕ) ×
    ({i : Fin m // base.IsPos i} → ℕ)

/-- The ordered product itself, not an arbitrary admitted label for a monomial. -/
def orderedIntegralMonomial (base : P.Base)
    (D : ReductiveChevalleyFrame (r := r) (L := L) P) :
    PBWExponent (r := r) base → IntegralForm D := by
  classical
  intro a
  let neg := ((Finset.univ : Finset {i : Fin m // ¬base.IsPos i}).sort (· ≤ ·)).map
    (fun i => rootDividedPower D i.1 (a.1 i))
  let tor := ((Finset.univ : Finset (Fin r)).sort (· ≤ ·)).map
    (fun j => toralBinomial D j (a.2.1 j))
  let pos := ((Finset.univ : Finset {i : Fin m // base.IsPos i}).sort (· ≤ ·)).map
    (fun i => rootDividedPower D i.1 (a.2.2 i))
  exact neg.prod * tor.prod * pos.prod

/-- The ordered negative-root, full-torus and positive-root monomials form a
ℤ-basis of the integral enveloping form, including root-free and rank-zero data. -/
theorem integral_pbw (base : P.Base)
    (D : ReductiveChevalleyFrame (r := r) (L := L) P) :
    LinearIndependent ℤ (orderedIntegralMonomial base D) ∧
      Submodule.span ℤ (Set.range (orderedIntegralMonomial base D)) = ⊤ := by
  sorry

end
end IntegralPBW
/-! ## Layer 11: braid permutation monodromy -/

namespace BraidMonodromy

/-- The permutation map from braids on at least two strands admits no group-homomorphic
section; the exponent sum of an involution is zero, whereas a transposition has odd parity. -/
theorem permutation_extension_nonsplit (n : ℕ) (hn : 2 ≤ n) :
    ¬ ∃ s : Equiv.Perm (Fin n) →* TauCeti.BraidGroup n,
      (TauCeti.BraidGroup.permHom n).comp s = MonoidHom.id _ := by
  sorry

end BraidMonodromy
end TauCetiRoadmap.ReductiveGroups
