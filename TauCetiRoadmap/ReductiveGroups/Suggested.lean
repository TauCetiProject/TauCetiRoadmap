import Mathlib
import TauCeti.Algebra.AlgebraicGroup.FunctorOfPoints
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Coinvariants.Basic
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Conjugation
import TauCeti.Algebra.AlgebraicGroup.Connected.CommHopfAlgCat
import TauCeti.Algebra.AlgebraicGroup.Unipotent.Radical.Construction
import TauCeti.Algebra.AlgebraicGroup.Torus.Maximal
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.Algebra.AlgebraicGroup.Parabolic.Basic
import TauCeti.GroupTheory.SpecificGroups.Braid.Basic

/-!
# Reductive algebraic groups: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs, each admitted with `sorry`, together with
the few definitions those statements need.

Stated here, because every carrier exists at the pins: Layer 6A's characteristic-zero Levi
complement (Mostow); Layer 7's conjugacy of maximal tori over an algebraically closed field and
the Levi complement of a parabolic subgroup of a reductive group over every field; Layer 7a's
Lang theorem for smooth geometrically connected groups over a finite field; and Layer 11A's
identification of the fundamental group of the unordered configuration space of the plane with
the braid group.

Proved at the pinned Tau Ceti, hence consumed through the README's supplier contracts and not
stated here: the embedding theorem of Layer 1, the closed-orbit theorem of Layer 3A, the
characteristic-zero equivalence of reductivity and linear reductivity of Layer 6, Matsushima's
affine quotient of Layer 6B, the conjugacy of Borel subgroups of Layer 7, and the rational
points of an `𝔽_q`-form as Frobenius-fixed points of Layer 7a.

Not statable at the pins, hence not stated, with the missing carrier named:
* Layer 7: the root datum of a reductive group with respect to a maximal torus, its Weyl group
  `N(T)/T` and the Bruhat decomposition `B\G/B ≃ W`. The missing carrier is the root datum
  extracted from a group: the pinned predicates give tori, Borel and parabolic subgroups, but no
  roots, coroots or reflection group attached to a maximal torus of a reductive group.
* Layers 7c–7f: the Harish–Chandra biadjunctions, the parabolic Mackey formula and common-Levi
  independence. The missing carriers are the Harish–Chandra functors between the representation
  categories of the finite groups `L^F` and `G^F`, built on the finite point groups of `P`, `U`
  and `L`.
* Layer 7g: Lang–Steinberg surjectivity for a Steinberg endomorphism. The missing carrier is an
  `𝔽_q′`-structure on the group whose `q′`-Frobenius is a positive power of the endomorphism.
* Layer 8: the isomorphism and existence theorems for split reductive groups. The missing
  carrier is again the root datum of a split reductive group.
* Layer 9: the pinned Chevalley–Demazure group scheme of a root datum and its identification with
  the explicit carriers. The missing carrier is the group scheme over `ℤ` attached to an
  arbitrary root datum.
* Layer 10: the induced, Weyl and simple modules of a reductive group and their classification
  by dominant weights. The missing carrier is the category of rational representations of a
  reductive group with its highest-weight structure.
* Layer 11B: Brieskorn's theorem `π₁(V_reg/W) ≃ ArtinGroup (coxeterMatrixOfBase P base)`. The
  group side exists (`TauCeti.ArtinGroup`, `TauCeti.coxeterMatrixOfBase`); the missing carrier is
  the complexified root-hyperplane complement of a root pairing with its Weyl-group action and
  quotient topology.
* Layer 11D: the isomorphism `π₁(𝔤_rs) ≃ π₁(𝔱_reg/W)` induced by the spectral projection. The
  missing carriers are the regular-semisimple locus of the Lie algebra of a complex reductive
  group, with the topology of its complex points, and the Weyl quotient of `𝔱_reg`.
-/

namespace TauCetiRoadmap.ReductiveGroups

universe u

/-! ## Layer 6A: characteristic-zero Levi complements -/

/-- **Mostow's theorem.** Over a field of characteristic zero, a geometrically connected affine
group `G` of finite type has a Levi complement: a closed subgroup `L` mapping isomorphically onto
`Q = G/R_u(G)`. In coordinates, with `I_u` the Hopf ideal of the unipotent radical, `O(Q)` is the
subalgebra of `O(G)` of functions invariant under right translation by `R_u(G)`, and `L` is cut
out by a Hopf ideal `J` for which `O(Q) → O(G) → O(G)/J` is bijective. Smoothness is automatic
in characteristic zero (Cartier). See McNinch, *Levi decompositions of a linear algebraic group*,
§3.1, p. 6. In characteristic `p` a Levi complement need not exist (McNinch, §3.2, p. 6). -/
theorem exists_leviComplement_of_charZero {k : Type u} [Field k] [CharZero k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k)
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty k H.obj) :
    ∃ J : TauCeti.HopfIdeal k H,
      Function.Bijective
        ((Ideal.Quotient.mkₐ k J.toIdeal).comp
          (TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalDefiningIdeal H).coinvariants.val) := by
  sorry

/-! ## Layer 7: maximal tori and Levi complements of parabolic subgroups -/

/-- **Conjugacy of maximal tori.** Over an algebraically closed field, any two maximal tori of
an affine group of finite type are conjugate by a rational point. The tori lie in the identity
component of the reduced subgroup, a connected group variety, where this is Milne, *Algebraic
groups* (v2.00), Theorem 18.14, p. 316. Over `ℝ` the conclusion fails: the diagonal torus and
`SO₂` are maximal tori of `SL₂` that no real point conjugates into each other. -/
theorem exists_conjugate_eq_of_isMaximalTorus {k : Type u} [Field k] [IsAlgClosed k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k) {I J : TauCeti.HopfIdeal k H}
    (hI : TauCeti.HopfIdeal.IsMaximalTorus k H.obj I)
    (hJ : TauCeti.HopfIdeal.IsMaximalTorus k H.obj J) :
    ∃ g : WithConv (H →ₐ[k] k), I.conjugate g = J := by
  sorry

/-- **Levi complements of parabolic subgroups, over every field.** Let `G` be a connected
reductive group over a field `k` and `P` a parabolic `k`-subgroup, cut out by the Hopf ideal `I`.
With `U` the `k`-unipotent radical of `P` and `O(P/U)` the subalgebra of `O(P)` of functions
invariant under right translation by `U`, there is a closed `k`-subgroup `L` of `P`, cut out by a
Hopf ideal `J` of `O(P)`, for which `O(P/U) → O(P) → O(P)/J` is bijective; that is, `P = L ⋉ U`.
See Conrad–Feng, *Reductive groups over fields*, §6.3, p. 58, where `P = P_G(λ)`,
`U = U_G(λ)` and `L = Z_G(λ)` for a cocharacter `λ`. Reductivity is needed: McNinch, *Levi
decompositions of a linear algebraic group*, §3.2, gives a group in characteristic `p`, parabolic
in itself, with no Levi factor. -/
theorem exists_leviComplement_of_isParabolic {k : Type u} [Field k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k)
    (hred : TauCeti.reductiveCommHopfAlgProperty k H)
    (I : TauCeti.HopfIdeal k H) (hP : TauCeti.HopfIdeal.IsParabolic k H.obj I) :
    ∃ J : TauCeti.HopfIdeal k (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I),
      Function.Bijective
        ((Ideal.Quotient.mkₐ k J.toIdeal).comp
          (TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalDefiningIdeal
            (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I)).coinvariants.val) := by
  sorry

/-! ## Layer 7a: Lang's theorem over a finite field -/

/-- **Lang's theorem.** Let `G` be a smooth geometrically connected affine group of finite type
over a finite field `k` with `q` elements, and `K` an algebraically closed extension of `k`. Let
`F` be the `q`-power Frobenius of `K`, a `k`-algebra endomorphism determined by `F a = a ^ q`; it
acts on `G(K) = Hom_k(O(G), K)` by post-composition (`AlgHom.mapValue F`). The Lang map
`g ↦ g⁻¹ F(g)` is surjective on `G(K)`
(Milne, *Algebraic groups* (v2.00), Proposition 27.54, p. 487, and Corollary 27.55, p. 488).
Connectedness is needed: for `q` odd, `μ₂ = ℤ/2` is smooth with trivial Frobenius, and the Lang
map is constant. -/
theorem langMap_surjective {k : Type u} [Field k] [Finite k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k)
    (hsm : Algebra.Smooth k H)
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty k H.obj)
    {K : Type u} [Field K] [Algebra k K] [IsAlgClosed K]
    (F : K →ₐ[k] K) (hF : ∀ a : K, F a = a ^ Nat.card k) :
    Function.Surjective fun g : WithConv (H →ₐ[k] K) =>
      g⁻¹ * AlgHom.mapValue (H := H) F g := by
  sorry

/-! ## Layer 9: lifts of automorphisms to a central extension by `ℤˣ` -/

namespace CoverLifts

universe uC vC wC

variable {E : Type uC} {Q : Type vC} {A : Type wC} [Group E] [Group Q] [Group A]

/-- For a central extension `S` of `Q` by `ℤˣ` and an action `ρ` of `A` on `Q`, the subgroup of
`MulAut E × A` of pairs `(φ, a)` with `φ` fixing the kernel `ℤˣ` pointwise and lifting `ρ a`. -/
def liftSubgroup (S : GroupExtension ℤˣ E Q) (ρ : A →* MulAut Q) :
    Subgroup (MulAut E × A) where
  carrier := {p | (∀ s, p.1 (S.inl s) = S.inl s) ∧
    ∀ e, S.rightHom (p.1 e) = ρ p.2 (S.rightHom e)}
  one_mem' := ⟨fun _ => rfl, fun e => by simp⟩
  mul_mem' := by
    rintro ⟨φ, a⟩ ⟨ψ, b⟩ ⟨hφ₁, hφ₂⟩ ⟨hψ₁, hψ₂⟩
    refine ⟨fun s => ?_, fun e => ?_⟩
    · change φ (ψ (S.inl s)) = S.inl s
      rw [hψ₁, hφ₁]
    · change S.rightHom (φ (ψ e)) = ρ (a * b) (S.rightHom e)
      rw [hφ₂, hψ₂, map_mul, MulAut.mul_apply]
  inv_mem' := by
    rintro ⟨φ, a⟩ ⟨hφ₁, hφ₂⟩
    refine ⟨fun s => ?_, fun e => ?_⟩
    · change φ⁻¹ (S.inl s) = S.inl s
      conv_lhs => rw [← hφ₁ s]
      exact φ.symm_apply_apply (S.inl s)
    · change S.rightHom (φ⁻¹ e) = ρ a⁻¹ (S.rightHom e)
      have h : S.rightHom e = ρ a (S.rightHom (φ⁻¹ e)) := by
        have h' := hφ₂ (φ⁻¹ e)
        change S.rightHom (φ (φ⁻¹ e)) = ρ a (S.rightHom (φ⁻¹ e)) at h'
        rwa [MulAut.apply_inv_self] at h'
      rw [h, map_inv, MulAut.inv_apply_self]

/-- The group of lifts of the `A`-action on `Q` to automorphisms of `E` fixing the kernel. -/
abbrev LiftGroup (S : GroupExtension ℤˣ E Q) (ρ : A →* MulAut Q) := liftSubgroup S ρ

/-- The projection from the lift group to `A`. -/
def projection (S : GroupExtension ℤˣ E Q) (ρ : A →* MulAut Q) :
    LiftGroup S ρ →* A where
  toFun l := l.val.2
  map_one' := rfl
  map_mul' _ _ := rfl

end CoverLifts

/-! ## Layer 11A: plane configurations and the braid group -/

namespace PlaneConfiguration

/-- Ordered configurations of `n` distinct points of `ℂ`, with the subspace topology of
`Fin n → ℂ`. -/
abbrev Ordered (n : ℕ) := {z : Fin n → ℂ // Function.Injective z}

/-- Permutations act on ordered configurations by `(σ • z)_i = z_(σ⁻¹ i)`. -/
instance instMulActionPerm (n : ℕ) : MulAction (Equiv.Perm (Fin n)) (Ordered n) where
  smul σ z := ⟨fun i => z.1 (σ⁻¹ i), z.2.comp (σ⁻¹).injective⟩
  one_smul _ := rfl
  mul_smul _ _ _ := rfl

/-- Unordered configurations of `n` distinct points of `ℂ`, with the quotient topology. -/
abbrev Unordered (n : ℕ) := Quotient (MulAction.orbitRel (Equiv.Perm (Fin n)) (Ordered n))

/-- The ordered base configuration `z_i = i`. -/
def orderedBase (n : ℕ) : Ordered n :=
  ⟨fun i => (i.val : ℂ), fun _ _ h => Fin.ext (Nat.cast_injective (R := ℂ) h)⟩

/-- The unordered base configuration, the image of `orderedBase n`. -/
def unorderedBase (n : ℕ) : Unordered n := Quotient.mk _ (orderedBase n)

/-- **The braid group as a fundamental group.** The fundamental group of the space of unordered
configurations of `n` distinct points of the plane is the Artin braid group on `n` strands
(Fox–Neuwirth, *The braid groups*, §§6–7, pp. 122–124). For `n = 0, 1` both sides are trivial. -/
theorem nonempty_fundamentalGroup_mulEquiv_braidGroup (n : ℕ) :
    Nonempty (FundamentalGroup (Unordered n) (unorderedBase n) ≃* TauCeti.BraidGroup n) := by
  sorry

end PlaneConfiguration

end TauCetiRoadmap.ReductiveGroups
