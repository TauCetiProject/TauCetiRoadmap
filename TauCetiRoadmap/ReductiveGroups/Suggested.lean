import Mathlib
import TauCeti.Algebra.AlgebraicGroup.LinearlyReductive
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.Algebra.AlgebraicGroup.Torus.Basic
import TauCeti.Algebra.AlgebraicGroup.Torus.Maximal
import TauCeti.Algebra.AlgebraicGroup.Borel.Basic
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Conjugation
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Coinvariants.Basic
import TauCeti.Algebra.AlgebraicGroup.Unipotent.Radical.Construction
import TauCeti.Algebra.Lie.UniversalEnveloping.Kostant.Form
import TauCeti.GroupTheory.SpecificGroups.Braid.Basic
import TauCeti.GroupTheory.Coxeter.Artin
import TauCeti.LinearAlgebra.RootSystem.Coxeter.Matrix

/-!
# Reductive algebraic groups: target signatures

The roadmap is README.md; this file is not the roadmap. It states headline theorems
against the pinned APIs: local closedness of the orbits of a finite-type group over any field,
strict dimension drop at the boundary and closed orbits in orbit closures for smooth groups over
an algebraically closed field, compactness of proper complex scheme points (Layer 3A);
characteristic-zero equivalence of reductivity and complete
reducibility, and Nagata's characteristic-`p` criterion that a smooth connected affine group is
linearly reductive exactly when it is a torus (Layer 6); the characteristic-zero Levi complement
of §6A in Hopf coordinates; conjugacy of Borel subgroups and of maximal tori by rational points
over an algebraically closed field (Layer 7); Lang surjectivity over finite fields (Layer 7a);
integral PBW for the full reductive Chevalley frame, including its central torus (Layer 9A);
Artin's identification of the fundamental group of the unordered configuration space of the
plane with the braid group, and nonsplitting of the braid permutation extension for at least two
strands (§11A); and Brieskorn's identification of the fundamental group of the regular orbit
space of a finite Weyl arrangement with the Artin group of its Coxeter matrix (§11B).

The pinned Tau Ceti proves conjugacy of Borel subgroups only under a hypothesis:
`TauCeti.HopfIdeal.exists_conjugate_eq_of_isBorelOverAlgClosed`
(`TauCeti/Algebra/AlgebraicGroup/Borel/Conjugation.lean`) assumes a Borel candidate into a
conjugate of which every Borel subgroup can be moved. The unconditional theorem of §7.1 is
stated below.

The signed ADE integral Lie construction and its full-lattice comparison lack the
constructed signed root-space Lie algebra and its Chevalley-frame identification. The
lift theorem of §9A.1a-L, that every shell-preserving Gram isometry of the root lattice `Q`
lifts to the signed cover with kernel `Hom(Q, {±1})`, lacks that signed cover: the central
extension of `Q` by `ℤˣ` whose factor set is the sign of the ordered Gram form, which neither
Mathlib nor Tau Ceti provides and which §9A.1a constructs.
The pinned fixed-Lie folding classification lacks that Lie algebra with its pinned
diagram action, integral fixed lattice and normalized folded root datum. Native
fixed-subalgebra and Serre-presentation carriers alone do not identify these objects.
The general pinned integral model and its change-of-choice theorem lack the root datum of a
pinned split reductive group scheme as a root pairing: the pinned `TauCeti.Pinning` indexes its
root vectors by simple roots read off from the group, and root data are extracted only for
specific matrix groups.
The relative structure theorems of §8.2 lack the center of an affine group scheme over a base
ring: the pinned center, `TauCeti.CommHopfAlgCat.centerDefiningIdeal`, is constructed over a
field. Affineness of quotients of affine algebraic groups by closed subgroups with reductive
identity component over an algebraically closed characteristic-zero field (§6B) lacks the
comparison of the pinned fppf homogeneous quotient with the spectrum of the right invariants:
the pinned representation of an fppf quotient by coinvariants,
`TauCeti.CommHopfAlgCat.coinvariantsFppfQuotientIso`, is for normal subgroups only. The
highest-weight classification lacks the rational highest-weight modules and their
identification with the prescribed integral model. The spectral monodromy theorem
lacks the constructed regular-semisimple quotient and its analytic comparison on
the native group-point carrier. The full smooth-chart comparison lacks the compatible manifold atlas on native
scheme points; this is a construction of README §3A.5. The semidirect-product form
`U ⋊ L ≃ G` of the Levi decomposition of §6A is the Hopf-coordinate statement below, read as an
isomorphism of the Levi complement with the reductive quotient; it is not restated separately.
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
The generator-characterized forms of the Artin and Brieskorn isomorphisms of §§11A–11B, which
send the half-twist loops and the wall-crossing loops to the standard generators, lack those
loops: they are the based constructions of §§11A–11B, and only the isomorphism type is
stated here.
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

/-- Over any field `k`, the orbit of a rational point under an algebraic action of a group scheme
of finite type over `k` on a scheme of finite type over `k` is locally closed. Neither
smoothness nor affineness of the group, separatedness of the scheme nor algebraic closedness of
`k` is needed (Milne 2017, Proposition 1.65(b), pp. 26–27, applied to the orbit map, which is
equivariant for left translation, as in the definition of orbits that follows it on p. 27).
Quasi-compactness of the group is needed: the constant group `ℤ` translating the affine line
over `ℚ` has the integers as the orbit of `0`, which is dense and not open in the line. -/
theorem orbit_locallyClosed
    [hGroupFiniteType : LocallyOfFiniteType G.hom] [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom] [hXQC : QuasiCompact X.hom] (x : Points X) :
    IsLocallyClosed (geometricOrbit G X x) := by sorry

/-- For a smooth group of finite type over an algebraically closed field acting on a separated
scheme of finite type, the boundary of an orbit has strictly smaller dimension than the orbit,
also for disconnected groups and nonaffine groups (Milne 2017, proof of Proposition 1.66,
pp. 27–28, applied componentwise). -/
theorem boundary_dimension_lt
    [hAlgClosed : IsAlgClosed k]
    [hSmooth : Smooth G.hom] [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x : Points X) :
    topologicalKrullDim (orbitBoundary G X x) < orbitDimension G X x := by sorry

/-- For a smooth group of finite type over an algebraically closed field acting on a separated
scheme of finite type, each orbit closure contains a closed orbit (Milne 2017, Proposition 1.66
and its proof, pp. 27–28: the boundary is a union of orbits of smaller dimension, so an orbit of
least dimension in the closure is closed). Applied at any rational point, it gives a closed orbit
on every such scheme with a rational point. -/
theorem exists_closed_orbit_in_closure
    [hAlgClosed : IsAlgClosed k]
    [hSmooth : Smooth G.hom] [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x : Points X) :
    ∃ y : Points X, IsClosed (geometricOrbit G X y) ∧
      geometricOrbit G X y ⊆ orbitClosure G X x := by sorry

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

/-! ## Layer 7: Borel subgroups and maximal tori -/

namespace BorelTori

/-- Over an algebraically closed field `k`, any two Borel subgroups of a finite-type affine
group `G` are conjugate by a rational point: if the Hopf ideals `I` and `J` cut out Borel
subgroups `B` and `B'` (maximal smooth, geometrically connected, geometrically solvable closed
subgroups; algebraic closedness of `k` is a conjunct of `TauCeti.HopfIdeal.IsBorelOverAlgClosed`),
then `I.conjugate g = J` for some `g ∈ G(k)` (Milne 2017, Theorem 17.9(b), p. 354, for smooth
connected `G`; a smooth connected subgroup of `G` lies in the smooth connected subgroup
`(G_red)°`, so the Borel subgroups of `G` are those of `(G_red)°`, whose rational points are
rational points of `G`). The pinned
`TauCeti.HopfIdeal.exists_conjugate_eq_of_isBorelOverAlgClosed` assumes in addition a Borel
candidate into a conjugate of which every Borel subgroup can be moved. For `GL₂` the upper and
lower triangular Borel subgroups are exchanged by the permutation matrix; for the constant
group `ℤ/2` the only Borel subgroup is the trivial one. -/
theorem exists_conjugate_eq_of_isBorelOverAlgClosed (k : Type u) [Field k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k) {I J : TauCeti.HopfIdeal k H.obj}
    (hI : TauCeti.HopfIdeal.IsBorelOverAlgClosed k H I)
    (hJ : TauCeti.HopfIdeal.IsBorelOverAlgClosed k H J) :
    ∃ g : WithConv (H.obj →ₐ[k] k), I.conjugate g = J := by
  sorry

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
/-! ## Layer 11: plane configurations and braid permutation monodromy -/

namespace BraidMonodromy

/-- Ordered configurations of `n` distinct points of the complex plane: the injective tuples
`PConf_n(ℂ)` of §11A, with the subspace topology of `ℂⁿ`. -/
def orderedConfiguration (n : ℕ) : Set (Fin n → ℂ) := {z | Function.Injective z}

/-- Unordered configurations `Conf_n(ℂ)` of §11A: the image of `orderedConfiguration n` in the
quotient of `ℂⁿ` by the permutation action `(σ • z) i = z (σ⁻¹ i)` (Mathlib's `arrowAction`),
with the subspace topology of the quotient topology. Since `orderedConfiguration n` is open and
stable under permutations, this space is homeomorphic to `PConf_n(ℂ)/S_n` with its quotient
topology. -/
def unorderedConfiguration (n : ℕ) :
    Set (Quotient (@MulAction.orbitRel (Equiv.Perm (Fin n)) (Fin n → ℂ) _ arrowAction)) :=
  Quotient.mk _ '' orderedConfiguration n

/-- Artin's theorem in the form of Fox and Neuwirth: at any configuration, the fundamental group
of the unordered configuration space of `n` points of the plane is the braid group on `n`
strands, Tau Ceti's Artin group of type `A_(n-1)` (Fox–Neuwirth, *The braid groups*, Math.
Scand. 10 (1962), §§6–7, pp. 122–126). For `n = 0` and `n = 1` the space is a point and a copy of
`ℂ` and both groups are trivial; for `n = 2` the space is homotopy equivalent to `ℂˣ` and both
groups are `ℤ`. -/
theorem nonempty_mulEquiv_braidGroup (n : ℕ) (z : Fin n → ℂ) (hz : z ∈ orderedConfiguration n) :
    Nonempty (FundamentalGroup (unorderedConfiguration n) ⟨Quotient.mk _ z, z, hz, rfl⟩ ≃*
      TauCeti.BraidGroup n) := by
  sorry

/-- The permutation map from braids on at least two strands admits no group-homomorphic
section; the exponent sum of an involution is zero, whereas a transposition has odd parity. -/
theorem permutation_extension_nonsplit (n : ℕ) (hn : 2 ≤ n) :
    ¬ ∃ s : Equiv.Perm (Fin n) →* TauCeti.BraidGroup n,
      (TauCeti.BraidGroup.permHom n).comp s = MonoidHom.id _ := by
  sorry

end BraidMonodromy

/-! ## Layer 11: the finite Weyl-arrangement theorem -/

namespace WeylArrangement
noncomputable section

variable {Λ M N : Type*} [AddCommGroup M] [Module ℂ M] [AddCommGroup N] [Module ℂ N]

/-- The complement in the root space `M` of the reflecting hyperplanes of the Weyl group: the
vectors on which no coroot vanishes, `V_reg` of §11B. -/
def weylRegularLocus (P : RootPairing Λ ℂ M N) : Set M := {v | ∀ i, P.coroot' i v ≠ 0}

/-- The regular orbit space `B_W = V_reg/W` of §11B: the image of `weylRegularLocus P` in the
orbit space of `M` under Mathlib's Weyl group `P.weylGroup` with its native action on the root
space, with the subspace topology of the quotient topology. -/
def weylRegularOrbitSpace (P : RootPairing Λ ℂ M N) :
    Set (Quotient (MulAction.orbitRel P.weylGroup M)) :=
  Quotient.mk _ '' weylRegularLocus P

/-- Brieskorn's theorem for finite Weyl arrangements. For a finite reduced crystallographic root
pairing `P` over `ℂ` on a finite-dimensional root space and a base `b`, the fundamental group of
the regular orbit space, at the class of any regular vector, is the Artin group of the Coxeter
matrix of `b` (Brieskorn, *Sur les groupes de tresses*, Séminaire Bourbaki 1971/72, exposé 401,
Proposition 1, p. 25, for a finite irreducible real reflection group acting on the
complexification of its real representation, proved in Brieskorn, Invent. Math. 12 (1971); Ernst,
*Cell Complexes for Arrangements with Group Actions*, Theorem 6.10, p. 46). On the span of the
roots `P` is the complexification of its real form, a product of root pairings gives a product
of orbit spaces, and the subspace on which every coroot vanishes is a contractible factor fixed
by the Weyl group. For `A₁` the regular orbit space is `ℂˣ/{±1} ≅ ℂˣ` and both groups are `ℤ`;
with no roots both groups are trivial. Applied to `P.flip` it gives the same statement for the
complement of the root hyperplanes in the coroot space. -/
theorem nonempty_mulEquiv_artinGroup [Finite Λ] [TopologicalSpace M] [IsModuleTopology ℂ M]
    [FiniteDimensional ℂ M] (P : RootPairing Λ ℂ M N) [P.IsCrystallographic] [P.IsReduced]
    (b : P.Base) (v : M) (hv : v ∈ weylRegularLocus P) :
    Nonempty (FundamentalGroup (weylRegularOrbitSpace P) ⟨Quotient.mk _ v, v, hv, rfl⟩ ≃*
      TauCeti.ArtinGroup (TauCeti.coxeterMatrixOfBase P b)) := by
  sorry

end
end WeylArrangement
end TauCetiRoadmap.ReductiveGroups
