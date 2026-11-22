module

public import Mathlib
public import TauCeti.Algebra.GroupAction.Trivial
public import TauCeti.GroupTheory.GroupExtension.Of.FactorSet
public import TauCeti.LinearAlgebra.BilinearForm.Isometry

/-!
# Metaplectic automorphic forms, Part II (finite Weil–Heisenberg representations): target signatures

**This file is not the roadmap.** The roadmap is `README.md`; this file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need.

Stated here:

* Layer 1: the finite Stone–von Neumann theorem for the Heisenberg group of a nondegenerate
  alternating space over a finite field of odd characteristic (dimension, vanishing of the
  character off the centre, uniqueness), and the fully ramified theorem for a finite group `J`, a
  normal subgroup `H` with abelian quotient and a `J`-invariant character `θ` of `H` whose
  commutator pairing is nondegenerate (`dim² = [J : H]`, character, uniqueness).
* Layer 2: existence and uniqueness of the normalized finite Weil representation in the
  Schrödinger model of a full polarization `X × X*`, characterized by Egorov covariance and the
  parity-determinant identity `det W(g) = (det W(g)|S⁺)²`; this includes `Sp₂(𝔽₃)`.
* Layer 3: the corrected Gérardin induction formula: for a group `P` of isometries stabilizing an
  isotropic `I`, the restriction of the Weil–Heisenberg representation to `H(V) ⋊ P` is induced
  from the subgroup `H(I^⊥) ⋊ P` by the Weil–Heisenberg representation of `I^⊥/I` twisted by the
  quadratic character of the determinant on `I`; and the isotropic-invariants theorem for fully
  ramified characters: the `U`-invariants of the unique representation form an irreducible
  representation of the orthogonal `Q` of dimension `√[Q : HU]`.
* Layer 4: on the line fixed by a Lagrangian `L`, an element of `Sp` stabilizing `L` acts through
  the quadratic character of its determinant on `L`; and the normalized Weil representation of a
  finite product polarization restricts on blockwise elements to the tensor product of the
  normalized Weil representations of the factors.

Every headline theorem of the roadmap is stated. Existence of an irreducible representation on
which a normal subgroup acts through a conjugation-invariant character needs none of the
commutator, nondegeneracy or characteristic hypotheses: the subgroup acts by that character on
the whole induced representation, so every irreducible subrepresentation qualifies (the invariant
case of Clifford theory, InductionRestriction Layer 5). It is therefore not a headline of this
roadmap; for the Heisenberg group the Schrödinger model of README §1.2 realizes it.

The groups of the Gérardin formula are built from the coordinate action `heisenbergAction` of the
isometry group on `H(V)` with Mathlib's `SemidirectProduct`; the quotient `I^⊥/I` enters through
a linear map onto a polarized space that is onto and form-preserving on `I^⊥` with kernel `I`,
and the Weil–Heisenberg representations through the formulas `π(h) W(g)` that characterize them.
-/

@[expose] public section

namespace TauCetiRoadmap.MetaplecticAutomorphicFormsPartII

open Multiplicative

/-! ## Layer 0: Finite symplectic coordinates -/

section Polarization

variable (k X : Type*) [Field k] [AddCommGroup X] [Module k X]

/-- The standard symplectic form on `X × X*`: `((x, y), (x', y')) ↦ y'(x) − y(x')`
(README §0.2). -/
def polarizationForm : LinearMap.BilinForm k (X × Module.Dual k X) :=
  LinearMap.mk₂ k (fun p q => q.2 p.1 - p.2 q.1)
    (fun m₁ m₂ n => by simp only [Prod.fst_add, Prod.snd_add, map_add, LinearMap.add_apply]; ring)
    (fun c m n => by
      simp only [Prod.smul_fst, Prod.smul_snd, map_smul, LinearMap.smul_apply, smul_eq_mul]; ring)
    (fun m n₁ n₂ => by simp only [Prod.fst_add, Prod.snd_add, map_add, LinearMap.add_apply]; ring)
    (fun c m n => by
      simp only [Prod.smul_fst, Prod.smul_snd, map_smul, LinearMap.smul_apply, smul_eq_mul]; ring)

end Polarization

/-! ## Layer 1: Finite Heisenberg representations -/

section Heisenberg

attribute [local instance] TauCeti.trivialMulDistribMulAction

variable {k V : Type*} [Field k] [AddCommGroup V] [Module k V]

/-- The factor set `(v, w) ↦ ω(v, w)/2` of `V` with values in `k`, for the trivial action, defined
for every bilinear form `ω`: Tau Ceti's factor set `TauCeti.FactorSet.ofBimultiplicative` of the
bimultiplicative map `(v, w) ↦ ω(v, w)/2`. Its Tau Ceti extension has law
`(t, v)(s, w) = (t + s + ω(v, w)/2, v + w)`. When `ω` is alternating and `ringChar k ≠ 2` this is
the Heisenberg group `H(V)`, and the commutator of `(t, v)` and `(s, w)` is `(ω(v, w), 0)`; in
characteristic `2` the division takes the value `0` and the extension is abelian (README §1.1). -/
def heisenbergFactorSet (ω : LinearMap.BilinForm k V) :
    TauCeti.FactorSet (Multiplicative V) (Multiplicative k) :=
  TauCeti.FactorSet.ofBimultiplicative
    { toFun := fun v =>
        { toFun := fun w => ofAdd (ω v.toAdd w.toAdd / 2)
          map_one' := by simp
          map_mul' := fun w w' => by simp [add_div] }
      map_one' := by ext w; simp
      map_mul' := fun v v' => by ext w; simp [add_div] }
    (fun _ _ => rfl)

/-- The Heisenberg group `H(V)` of `(V, ω)`: coefficient-first coordinates `(t, v)`. -/
abbrev Heisenberg (ω : LinearMap.BilinForm k V) : Type _ :=
  (heisenbergFactorSet ω).Extension

/-- The action of the isometry group `Sp(V)` of `ω` on `H(V)` by automorphisms,
`g · (t, v) = (t, g v)`, fixing the centre. It is multiplicative because `g` preserves `ω`. This is
the action of MetaplecticAutomorphicForms §0.8 for the form `ω/2`, whose isometry group is that of
`ω` (README §1.1). -/
def heisenbergAction (ω : LinearMap.BilinForm k V) :
    TauCeti.BilinForm.isometryGroup ω →* MulAut (Heisenberg ω) where
  toFun g :=
    { toFun := fun x => ⟨x.left, ofAdd ((g : V ≃ₗ[k] V) x.right.toAdd)⟩
      invFun := fun x => ⟨x.left, ofAdd ((g : V ≃ₗ[k] V).symm x.right.toAdd)⟩
      left_inv := fun x => by ext <;> simp
      right_inv := fun x => by ext <;> simp
      map_mul' := fun x y => by
        have hg := TauCeti.BilinForm.mem_isometryGroup_iff.mp g.2
        apply TauCeti.FactorSet.Extension.ext
        · show x.left * x.right • y.left * heisenbergFactorSet ω (x.right, y.right) =
            x.left * _ • y.left * heisenbergFactorSet ω (_, _)
          simp only [TauCeti.trivialMulDistribMulAction_smul]
          congr 1
          have key : ∀ a b : Multiplicative V,
              heisenbergFactorSet ω (a, b) = ofAdd (ω a.toAdd b.toAdd / 2) := fun a b =>
            TauCeti.FactorSet.ofBimultiplicative_apply _ _ _
          rw [key, key, toAdd_ofAdd, toAdd_ofAdd, hg]
        · show ofAdd ((g : V ≃ₗ[k] V) (toAdd (x.right * y.right))) = _ * _
          simp }
  map_one' := by ext x <;> rfl
  map_mul' g h := by ext x <;> rfl

end Heisenberg

section Schrodinger

variable {k X : Type*} [Field k] [AddCommGroup X] [Module k X]

/-- The Schrödinger operator `π(t, x, y)` on `X → ℂ`:
`(π(t, x, y) f)(z) = ψ(t + y(z) + y(x)/2) f(z + x)` (README §1.2). -/
noncomputable def schrodingerOp (ψ : AddChar k ℂ) (t : k) (v : X × Module.Dual k X) :
    (X → ℂ) →ₗ[ℂ] (X → ℂ) where
  toFun f z := ψ (t + v.2 z + v.2 v.1 / 2) * f (z + v.1)
  map_add' f g := by ext z; simp [mul_add]
  map_smul' c f := by ext z; simp only [Pi.smul_apply, smul_eq_mul, RingHom.id_apply]; ring

end Schrodinger

section StoneVonNeumann

attribute [local instance] TauCeti.trivialMulDistribMulAction

variable {k V : Type*} [Field k] [AddCommGroup V] [Module k V]

/-- **Finite Stone–von Neumann theorem** (README §1.3). Every irreducible complex representation
of `H(V)` with central character `ψ` has dimension `√|V|`, its character vanishes off the
centre, and any two such representations are equivalent. (N02, Lemma 2.1 and the remark after
it, pp. 16–17; FS25, Lemma 3.3.1, p. 14.) -/
theorem finite_stoneVonNeumann [Finite k] [FiniteDimensional k V] (hk : ringChar k ≠ 2)
    (ω : LinearMap.BilinForm k V) (hω : ω.IsAlt) (hnd : ω.Nondegenerate)
    (ψ : AddChar k ℂ) (hψ : ψ ≠ 1)
    {E E' : Type*} [AddCommGroup E] [Module ℂ E] [FiniteDimensional ℂ E]
    [AddCommGroup E'] [Module ℂ E'] [FiniteDimensional ℂ E']
    (ρ : Representation ℂ (Heisenberg ω) E) [ρ.IsIrreducible]
    (hρ : ∀ (t : k) (ξ : E), ρ ((heisenbergFactorSet ω).inl (ofAdd t)) ξ = ψ t • ξ)
    (σ : Representation ℂ (Heisenberg ω) E') [σ.IsIrreducible]
    (hσ : ∀ (t : k) (ξ : E'), σ ((heisenbergFactorSet ω).inl (ofAdd t)) ξ = ψ t • ξ) :
    Module.finrank ℂ E ^ 2 = Nat.card V ∧
      (∀ g : Heisenberg ω, g.right ≠ 1 → ρ.character g = 0) ∧
      Nonempty (ρ.Equiv σ) := by
  sorry

end StoneVonNeumann

section FullyRamified

variable {J : Type*} [Group J] [Finite J]

/-- **Fully ramified characters** (README §1.4). Let `H` be normal in the finite group `J` with
`J/H` abelian, and `θ` a `J`-invariant character of `H` such that every `g ∉ H` has a commutator
`[g, x]` on which `θ` is nontrivial. Then an irreducible complex representation of `J` on which
`H` acts by `θ` has dimension `d` with `d² = [J : H]`, its character vanishes off `H`, and any two
such representations are equivalent. No exponent-`p` or special-isomorphism hypothesis is made:
the centre `H / ker θ` may be cyclic of any order. Such a representation exists as soon as `H` is
normal and `θ` is invariant (README §1.4). This general statement is proved by the route of
README §1.4; S08, Proposition 3.5, p. 14, and F21, Lemma 7.7 and the proof of Lemma 7.8,
pp. 30–31, are instances in their settings. -/
theorem fullyRamified_unique (H : Subgroup J) [hH : H.Normal]
    (hcomm : ∀ g x : J, g * x * g⁻¹ * x⁻¹ ∈ H) (θ : H →* ℂˣ)
    (hinv : ∀ (g : J) (h : H), θ ⟨g * h * g⁻¹, hH.conj_mem h h.2 g⟩ = θ h)
    (hnd : ∀ g : J, g ∉ H → ∃ x : J, θ ⟨g * x * g⁻¹ * x⁻¹, hcomm g x⟩ ≠ 1)
    {E E' : Type*} [AddCommGroup E] [Module ℂ E] [FiniteDimensional ℂ E]
    [AddCommGroup E'] [Module ℂ E'] [FiniteDimensional ℂ E']
    (ρ : Representation ℂ J E) [ρ.IsIrreducible] (hρ : ∀ (h : H) (ξ : E), ρ h ξ = (θ h : ℂ) • ξ)
    (σ : Representation ℂ J E') [σ.IsIrreducible]
    (hσ : ∀ (h : H) (ξ : E'), σ h ξ = (θ h : ℂ) • ξ) :
    Module.finrank ℂ E ^ 2 = H.index ∧ (∀ g : J, g ∉ H → ρ.character g = 0) ∧
      Nonempty (ρ.Equiv σ) := by
  sorry

end FullyRamified

/-! ## Layer 2: Genuine finite Weil representations -/

section Weil

variable {k X : Type*} [Field k] [AddCommGroup X] [Module k X]

variable (X) in
/-- The projector `f ↦ (f + f ∘ (−1))/2` onto the even functions `S⁺` (README §2.2). -/
noncomputable def evenPart : (X → ℂ) →ₗ[ℂ] (X → ℂ) where
  toFun f z := (f z + f (-z)) / 2
  map_add' f g := by ext z; simp only [Pi.add_apply]; ring
  map_smul' c f := by ext z; simp only [Pi.smul_apply, smul_eq_mul, RingHom.id_apply]; ring

/-- A homomorphism `W : Sp(X × X*) → GL(X → ℂ)` is a **normalized Weil representation** for `ψ`
if it satisfies Egorov covariance `W(g) π(t, v) W(g)⁻¹ = π(t, g v)` and the parity-determinant
identity `det W(g) = (det W(g)|S⁺)²`. The restricted determinant is written as the determinant of
`W(g) ∘ e + (1 − e)` for the even projector `e`, which equals `det(W(g)|S⁺)` because Egorov
covariance makes `W(g)` commute with parity (README §2.2). -/
def IsNormalizedWeil (ψ : AddChar k ℂ)
    (W : TauCeti.BilinForm.isometryGroup (polarizationForm k X) →* ((X → ℂ) ≃ₗ[ℂ] (X → ℂ))) :
    Prop :=
  (∀ (g : TauCeti.BilinForm.isometryGroup (polarizationForm k X)) (t : k)
      (v : X × Module.Dual k X),
      (W g).toLinearMap ∘ₗ schrodingerOp ψ t v =
        schrodingerOp ψ t ((g : (X × Module.Dual k X) ≃ₗ[k] (X × Module.Dual k X)) v) ∘ₗ
          (W g).toLinearMap) ∧
    ∀ g : TauCeti.BilinForm.isometryGroup (polarizationForm k X),
      LinearMap.det (W g).toLinearMap =
        LinearMap.det ((W g).toLinearMap ∘ₗ evenPart X + (LinearMap.id - evenPart X)) ^ 2

/-- **The normalized finite Weil representation** (README §2.2). Over a finite field of odd
characteristic and for nontrivial `ψ`, there is exactly one normalized Weil representation of
`Sp(X × X*)` on `X → ℂ`; this holds also for `Sp₂(𝔽₃)`, where linearizations of the projective
Weil representation are not unique. (N02, Theorems 4.2–4.3, pp. 20–22; FS25, Construction 3.4.2,
p. 17.) -/
theorem existsUnique_isNormalizedWeil [Finite k] [FiniteDimensional k X] (hk : ringChar k ≠ 2)
    (ψ : AddChar k ℂ) (hψ : ψ ≠ 1) :
    ∃! W : TauCeti.BilinForm.isometryGroup (polarizationForm k X) →* ((X → ℂ) ≃ₗ[ℂ] (X → ℂ)),
      IsNormalizedWeil ψ W := by
  sorry

end Weil

/-! ## Layer 3: Parabolic restriction and isotropic induction -/

section ParabolicInduction

attribute [local instance] TauCeti.trivialMulDistribMulAction

variable {k : Type*} [Field k]

/-- For a subspace `I` and a group `P` of isometries of `ω`, the subgroup `Q = H(I^⊥) ⋊ P` of
`H(V) ⋊ P`, generated by the Heisenberg elements `(t, v)` with `v ∈ I^⊥` and by `P`. When `P`
stabilizes `I` it consists of the pairs `((t, v), g)` with `v ∈ I^⊥` (README §3.3). -/
def parabolicSubgroup {V : Type*} [AddCommGroup V] [Module k V] (ω : LinearMap.BilinForm k V)
    (I : Submodule k V) (P : Subgroup (TauCeti.BilinForm.isometryGroup ω)) :
    Subgroup (Heisenberg ω ⋊[(heisenbergAction ω).comp P.subtype] P) :=
  ((AddSubgroup.toSubgroup (ω.orthogonal I).toAddSubgroup).comap
      (TauCeti.FactorSet.rightHom (heisenbergFactorSet ω))).map SemidirectProduct.inl ⊔
    SemidirectProduct.inr.range

/-- **The corrected Gérardin induction formula** (README §3.3). Let `W` be the normalized Weil
representation of `V = X × X*`, `I ≤ V` isotropic and `P ≤ Sp(V)` a subgroup stabilizing `I`.
Present `I^⊥/I` by a linear map `r : V → X₀ × X₀*` that on `I^⊥` is onto, has kernel `I` and
preserves the forms, and let `p₂ : P → Sp(X₀ × X₀*)` be the induced action, `r(g v) = p₂(g)(r v)`
on `I^⊥`. Let `Ω` be the Weil–Heisenberg representation `((t, v), g) ↦ π(t, v) W(g)` of
`H(V) ⋊ P`, and `σ` the representation of `Q = H(I^⊥) ⋊ P` given by
`((t, v), g) ↦ χ(det(g|_I)) π₀(t, r v) W₀(p₂ g)`, with `χ(d) = 1` for a square `d` and `−1`
otherwise. Then `Ω ≅ Ind_Q^{H(V) ⋊ P} σ`. The quadratic determinant character is the correction
of Gerardin77, Theorem 2.4(b), reported in F21, footnote 3, p. 33; the proof of F21, Lemma 7.10,
pp. 32–33, uses the corrected form. -/
theorem weilHeisenberg_parabolic_induction {X : Type*} [AddCommGroup X] [Module k X] [Finite k]
    [FiniteDimensional k X] (hk : ringChar k ≠ 2) (ψ : AddChar k ℂ) (hψ : ψ ≠ 1)
    (W : TauCeti.BilinForm.isometryGroup (polarizationForm k X) →* ((X → ℂ) ≃ₗ[ℂ] (X → ℂ)))
    (hW : IsNormalizedWeil ψ W)
    (I : Submodule k (X × Module.Dual k X)) (hI : I ≤ (polarizationForm k X).orthogonal I)
    (P : Subgroup (TauCeti.BilinForm.isometryGroup (polarizationForm k X)))
    (hP : ∀ (g : P), ∀ v ∈ I,
      ((g : TauCeti.BilinForm.isometryGroup (polarizationForm k X)) :
        (X × Module.Dual k X) ≃ₗ[k] (X × Module.Dual k X)) v ∈ I)
    {X₀ : Type*} [AddCommGroup X₀] [Module k X₀] [FiniteDimensional k X₀]
    (W₀ : TauCeti.BilinForm.isometryGroup (polarizationForm k X₀) →* ((X₀ → ℂ) ≃ₗ[ℂ] (X₀ → ℂ)))
    (hW₀ : IsNormalizedWeil ψ W₀)
    (r : (X × Module.Dual k X) →ₗ[k] (X₀ × Module.Dual k X₀))
    (hr : ((polarizationForm k X).orthogonal I).map r = ⊤)
    (hrI : ∀ v ∈ (polarizationForm k X).orthogonal I, r v = 0 ↔ v ∈ I)
    (hrω : ∀ v ∈ (polarizationForm k X).orthogonal I, ∀ w ∈ (polarizationForm k X).orthogonal I,
      polarizationForm k X₀ (r v) (r w) = polarizationForm k X v w)
    (p₂ : P →* TauCeti.BilinForm.isometryGroup (polarizationForm k X₀))
    (hp₂ : ∀ (g : P), ∀ v ∈ (polarizationForm k X).orthogonal I,
      r (((g : TauCeti.BilinForm.isometryGroup (polarizationForm k X)) :
        (X × Module.Dual k X) ≃ₗ[k] (X × Module.Dual k X)) v) =
        ((p₂ g : TauCeti.BilinForm.isometryGroup (polarizationForm k X₀)) :
          (X₀ × Module.Dual k X₀) ≃ₗ[k] (X₀ × Module.Dual k X₀)) (r v))
    (Ω : Representation ℂ
      (Heisenberg (polarizationForm k X) ⋊[(heisenbergAction (polarizationForm k X)).comp
        P.subtype] P) (X → ℂ))
    (hΩ : ∀ (h : Heisenberg (polarizationForm k X)) (g : P),
      Ω ⟨h, g⟩ = schrodingerOp ψ (toAdd h.left) (toAdd h.right) ∘ₗ (W g).toLinearMap)
    (σ : Representation ℂ (parabolicSubgroup (polarizationForm k X) I P) (X₀ → ℂ))
    (hσ : ∀ x : parabolicSubgroup (polarizationForm k X) I P,
      (IsSquare (LinearMap.det (M := I) (A := k)
          (((x.1.right : TauCeti.BilinForm.isometryGroup (polarizationForm k X)) :
            (X × Module.Dual k X) →ₗ[k] (X × Module.Dual k X)).restrict
              (hP x.1.right))) →
        σ x = schrodingerOp ψ (toAdd x.1.left.left)
            (r (toAdd x.1.left.right)) ∘ₗ
          (W₀ (p₂ x.1.right)).toLinearMap) ∧
      (¬ IsSquare (LinearMap.det (M := I) (A := k)
          (((x.1.right : TauCeti.BilinForm.isometryGroup (polarizationForm k X)) :
            (X × Module.Dual k X) →ₗ[k] (X × Module.Dual k X)).restrict
              (hP x.1.right))) →
        σ x = -(schrodingerOp ψ (toAdd x.1.left.left)
            (r (toAdd x.1.left.right)) ∘ₗ
          (W₀ (p₂ x.1.right)).toLinearMap))) :
    Nonempty (Ω.Equiv (σ.ind (parabolicSubgroup (polarizationForm k X) I P).subtype)) := by
  sorry

end ParabolicInduction

section IsotropicInvariants

variable {J : Type*} [Group J] [Finite J]

/-- **Isotropic invariants of a fully ramified representation** (README §3.4). In the situation
of `fullyRamified_unique`, let `U ≤ J` be a subgroup with `θ` trivial on `U ∩ H`, and let `Q` be
the set of `q ∈ J` with `θ([q, u]) = 1` for all `u ∈ U` (the inverse image of the orthogonal of
the image of `U`). Then the `U`-invariants `E^U` of the irreducible representation `ρ` are stable
under `Q`, irreducible under `Q`, and `(dim E^U)² · |HU| = |Q|`. Together with the dimension
count this identifies `E^U` with the fully ramified representation of `Q` attached to
`θ_U(hu) = θ(h)`, whose induction to `J` is `ρ`. This general finite-group statement is derived
from §1.4 by the route of README §3.4; S08, Lemma 5.6, Corollary 5.7, pp. 29–30, and Lemma 5.12,
p. 33 (for the groups `J¹_P` of a skew semisimple stratum), and FS25, Lemma 3.3.4(b), p. 15 (for
Heisenberg `𝔽_p`-groups), are instances. -/
theorem fullyRamified_isotropicInvariants (H : Subgroup J) [hH : H.Normal]
    (hcomm : ∀ g x : J, g * x * g⁻¹ * x⁻¹ ∈ H) (θ : H →* ℂˣ)
    (hinv : ∀ (g : J) (h : H), θ ⟨g * h * g⁻¹, hH.conj_mem h h.2 g⟩ = θ h)
    (hnd : ∀ g : J, g ∉ H → ∃ x : J, θ ⟨g * x * g⁻¹ * x⁻¹, hcomm g x⟩ ≠ 1)
    (U : Subgroup J) (hU : ∀ (u : J) (hu : u ∈ H), u ∈ U → θ ⟨u, hu⟩ = 1)
    {E : Type*} [AddCommGroup E] [Module ℂ E] [FiniteDimensional ℂ E]
    (ρ : Representation ℂ J E) [ρ.IsIrreducible] (hρ : ∀ (h : H) (ξ : E), ρ h ξ = (θ h : ℂ) • ξ) :
    (∀ q : J, (∀ u ∈ U, θ ⟨q * u * q⁻¹ * u⁻¹, hcomm q u⟩ = 1) →
        ∀ ξ ∈ Representation.invariants (ρ.comp U.subtype),
          ρ q ξ ∈ Representation.invariants (ρ.comp U.subtype)) ∧
      (∀ S : Submodule ℂ E, S ≤ Representation.invariants (ρ.comp U.subtype) →
        (∀ q : J, (∀ u ∈ U, θ ⟨q * u * q⁻¹ * u⁻¹, hcomm q u⟩ = 1) → ∀ ξ ∈ S, ρ q ξ ∈ S) →
          S = ⊥ ∨ S = Representation.invariants (ρ.comp U.subtype)) ∧
      Module.finrank ℂ (Representation.invariants (ρ.comp U.subtype)) ^ 2 *
          Nat.card (H ⊔ U : Subgroup J) =
        Nat.card {q : J // ∀ u ∈ U, θ ⟨q * u * q⁻¹ * u⁻¹, hcomm q u⟩ = 1} := by
  sorry

end IsotropicInvariants

/-! ## Layer 4: Fixed vectors and tensor products -/

section FixedLine

variable {k X : Type*} [Field k] [AddCommGroup X] [Module k X]

/-- **The Lagrangian fixed line carries the quadratic determinant character** (README §4.1). Let
`W` be the normalized Weil representation, `L ≤ X × X*` a Lagrangian (`L^⊥ = L`) and `g ∈ Sp`
with `g L ⊆ L`. On every function fixed by the Schrödinger operators `π(0, l)`, `l ∈ L`, the
operator `W(g)` is multiplication by `χ(det(g|_L))`, where `χ` is the quadratic character of `k`.
Since `g|_L` is invertible, `χ(det(g|_L))` is `1` when `det(g|_L)` is a square in `k` and `−1`
otherwise, which is the form stated. For `L` the inverse image of a Lagrangian `L₀` of `I^⊥/I`,
`det(g|_L) = det(g|_I) det(g|_{L₀})`, which is the form used for unipotent actions in Fintzen's
types. (F21, proof of Lemma 7.10 and footnote 3, pp. 32–34; N02, Theorem 4.3 and the computation
after it, pp. 22–23.) -/
theorem isNormalizedWeil_lagrangian_fixed [Finite k] [FiniteDimensional k X]
    (hk : ringChar k ≠ 2) (ψ : AddChar k ℂ) (hψ : ψ ≠ 1)
    (W : TauCeti.BilinForm.isometryGroup (polarizationForm k X) →* ((X → ℂ) ≃ₗ[ℂ] (X → ℂ)))
    (hW : IsNormalizedWeil ψ W)
    (L : Submodule k (X × Module.Dual k X)) (hL : (polarizationForm k X).orthogonal L = L)
    (g : TauCeti.BilinForm.isometryGroup (polarizationForm k X))
    (hg : ∀ v ∈ L, (g : (X × Module.Dual k X) ≃ₗ[k] (X × Module.Dual k X)) v ∈ L)
    (f : X → ℂ) (hf : ∀ l ∈ L, schrodingerOp ψ 0 l f = f) :
    (IsSquare (LinearMap.det (M := L) (A := k)
        (((g : (X × Module.Dual k X) ≃ₗ[k] (X × Module.Dual k X)) :
          (X × Module.Dual k X) →ₗ[k] (X × Module.Dual k X)).restrict hg)) → W g f = f) ∧
      (¬ IsSquare (LinearMap.det (M := L) (A := k)
        (((g : (X × Module.Dual k X) ≃ₗ[k] (X × Module.Dual k X)) :
          (X × Module.Dual k X) →ₗ[k] (X × Module.Dual k X)).restrict hg)) → W g f = -f) := by
  sorry

end FixedLine

section Tensor

/-- **Tensor compatibility of normalized Weil representations** (README §4.2). Let
`X = ∏ᵢ Xᵢ` be a finite product of finite-dimensional spaces, so that `X × X*` is the orthogonal
sum of the polarized spaces `Xᵢ × Xᵢ*` (a functional on `X` restricts to `Xᵢ` along the
coordinate inclusion). Let `W` and the `Wᵢ` be the normalized Weil representations for one
nontrivial `ψ`, and let `g ∈ Sp(X × X*)` act blockwise through `gᵢ ∈ Sp(Xᵢ × Xᵢ*)`. Then `W(g)`
sends the pure tensor `x ↦ ∏ᵢ fᵢ(xᵢ)` to the pure tensor of the `Wᵢ(gᵢ) fᵢ`. Pure tensors span
`X → ℂ`, so `W` restricted to `∏ᵢ Sp(Xᵢ × Xᵢ*)` is `⊗ᵢ Wᵢ`; for the empty family both sides are
the constant function `1`. (F21, the tensor description before Lemma 7.6, p. 30, and the proof of
Lemma 7.10, p. 32, for the tensor decomposition; the normalization is matched through
`existsUnique_isNormalizedWeil`.) -/
theorem isNormalizedWeil_pi_tensor {ι : Type*} [Fintype ι] [DecidableEq ι]
    {k : Type*} [Field k] [Finite k]
    (X : ι → Type*) [∀ i, AddCommGroup (X i)] [∀ i, Module k (X i)]
    [∀ i, FiniteDimensional k (X i)] (hk : ringChar k ≠ 2) (ψ : AddChar k ℂ) (hψ : ψ ≠ 1)
    (W : TauCeti.BilinForm.isometryGroup (polarizationForm k (∀ i, X i)) →*
      (((∀ i, X i) → ℂ) ≃ₗ[ℂ] ((∀ i, X i) → ℂ)))
    (Wᵢ : ∀ i, TauCeti.BilinForm.isometryGroup (polarizationForm k (X i)) →*
      ((X i → ℂ) ≃ₗ[ℂ] (X i → ℂ)))
    (hW : IsNormalizedWeil ψ W) (hWᵢ : ∀ i, IsNormalizedWeil ψ (Wᵢ i))
    (g : TauCeti.BilinForm.isometryGroup (polarizationForm k (∀ i, X i)))
    (gᵢ : ∀ i, TauCeti.BilinForm.isometryGroup (polarizationForm k (X i)))
    (hg : ∀ (v : (∀ i, X i) × Module.Dual k (∀ i, X i)) (i : ι),
      ((g.val v).1 i, (g.val v).2 ∘ₗ LinearMap.single k X i) =
        (gᵢ i).val (v.1 i, v.2 ∘ₗ LinearMap.single k X i))
    (f : ∀ i, X i → ℂ) :
    W g (fun x => ∏ i, f i (x i)) = fun x => ∏ i, Wᵢ i (gᵢ i) (f i) (x i) := by
  sorry

end Tensor

end TauCetiRoadmap.MetaplecticAutomorphicFormsPartII
