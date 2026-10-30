import Mathlib

/-!
# Reductive bundles, B(G) and Newton strata: headline targets

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`; this file gives suggested Lean statements for its headline theorems.

The Witt coefficient field makes the arithmetic classification for `GL_n` statable:

* `wittGL_isocrystal_classes` (§0.6) identifies sigma classes of invertible matrices
  with isomorphism classes of finite-dimensional native `WittVector.Isocrystal`s.
  This correspondence works over every perfect field of characteristic `p`.
* `wittGL_newton_classification` (§1.11) classifies those sigma classes over an
  algebraically closed residue field by descending rational slope tuples whose
  reduced denominators divide their multiplicities. The defining positive Frobenius
  power in `wittGLHasNewtonSlopes` also states the `GL_n` decent-representative
  existence of §1.12: in that basis the Frobenius norm is diagonal with entries
  `p ^ aᵢ`, and the slopes are `aᵢ / r`. Constant tuples give the basic classes;
  in positive rank their integral total is the Kottwitz invariant. Rank one recovers
  Mathlib's `WittVector.isocrystal_classification`.

These statements use actual matrices, coefficient Frobenius, bases and isocrystal
isomorphisms. The slope predicate has a real body in terms of a Frobenius iterate;
its existence and classification are assertions of the theorem.

The other headline statements need objects absent from the pinned libraries:

* Layer 0's rational filtered splitting, pure inner twisting and locally profinite
  classifying-stack theorem (§§0.2, 0.7, 0.9) need relative filtered fibre functors,
  torsor groupoids on the relevant sites and classifying v-stacks.
* The general reductive and general-local-field versions of Layer 1 need ramified
  and equal-characteristic coefficient theory, reductive Newton and integral
  Kottwitz maps, the local Iwahori–Weyl datum and algebraic sigma-centralizers.
  Straight-class comparison, acceptable and ordinary classes, torus comparisons
  and abelianized classification (§§1.10–1.13, 1.25–1.44) use these constructions.
* Layer 2's Beauville–Laszlo uniformization, isocrystal-family descent and Newton
  topology (§§2.12, 2.17, 2.20) need the relative curve with its bundle categories,
  the affine Grassmannian, families of G-isocrystals and the v-stack Bun_G.
* Layer 3's filtered relative automorphism theorem, stratum dimensions and connected
  components (§§3.3, 3.11, 3.18) need filtered fibre functors, full automorphism
  v-groups, Newton strata and cohomological smoothness and dimension.
* Layer 4's chart-image comparison and rank-two extension theorem (§§4.7–4.8) need
  filtered charts and Banach–Colmez extension spaces.

Tau Ceti's reductive group schemes, finite rational comodules and finite locally free
sheaves supply the algebraic foundations. Its Fargues–Fontaine Frobenius orbit space
is a topological space; the relative curve and bundle theory are further targets.
-/

open scoped Isocrystal
open WittVector

namespace TauCetiRoadmap.BunGAndNewtonStrata

variable (p : ℕ) [Fact p.Prime] (k : Type*) [Field k] [CharP k p]

section Perfect

variable [PerfectRing k p]

/-- Arithmetic Witt Frobenius applied to every coordinate of the standard vector space. -/
noncomputable def wittCoefficientFrobenius (n : ℕ) :
    (Fin n → K(p, k)) ≃ᶠˡ[p, k] (Fin n → K(p, k)) where
  toFun x i := FractionRing.frobenius p k (x i)
  invFun x i := (FractionRing.frobenius p k).symm (x i)
  left_inv x := funext fun i => (FractionRing.frobenius p k).symm_apply_apply (x i)
  right_inv x := funext fun i => (FractionRing.frobenius p k).apply_symm_apply (x i)
  map_add' x y := funext fun i => map_add (FractionRing.frobenius p k) (x i) (y i)
  map_smul' a x := funext fun i => map_mul (FractionRing.frobenius p k) a (x i)

/-- The native isocrystal structure with Frobenius `b ∘ σ`, applying coefficient Frobenius first. -/
noncomputable abbrev wittGLIsocrystal {n : ℕ}
    (b : Matrix.GeneralLinearGroup (Fin n) K(p, k)) :
    Isocrystal p k (Fin n → K(p, k)) where
  frob := (wittCoefficientFrobenius p k n).trans
    (Matrix.GeneralLinearGroup.toLin b).toLinearEquiv

/-- Arithmetic sigma conjugacy: `c = g b σ(g)⁻¹` on the native general linear group. -/
def wittGLSigmaSetoid (n : ℕ) : Setoid (Matrix.GeneralLinearGroup (Fin n) K(p, k)) where
  r b c := ∃ g, c = g * b * (Matrix.GeneralLinearGroup.map (FractionRing.frobenius p k) g)⁻¹
  iseqv := {
    refl := fun b => ⟨1, by simp⟩
    symm := by
      rintro b c ⟨g, rfl⟩
      refine ⟨g⁻¹, ?_⟩
      simp [mul_assoc]
    trans := by
      rintro b c d ⟨g, rfl⟩ ⟨h, rfl⟩
      refine ⟨h * g, ?_⟩
      simp [mul_assoc]
  }

/-- Descending rational Newton tuples with each denominator dividing its slope multiplicity. -/
def WittGLNewtonPolygon (n : ℕ) :=
  {s : Fin n → ℚ // Antitone s ∧ ∀ q : ℚ, q.den ∣ (Finset.univ.filter (fun i => s i = q)).card}

/-- The slope tuple of `b`, expressed by a basis on which a positive Frobenius power is
`p ^ aᵢ`, with `aᵢ = r * sᵢ`. Such a basis gives a decent representative after changing basis. -/
def wittGLHasNewtonSlopes {n : ℕ} (b : Matrix.GeneralLinearGroup (Fin n) K(p, k))
    (s : Fin n → ℚ) : Prop :=
  letI := wittGLIsocrystal p k b
  ∃ (e : Module.Basis (Fin n) K(p, k) (Fin n → K(p, k))) (r : ℕ) (a : Fin n → ℤ),
    0 < r ∧ (∀ i, (a i : ℚ) = r * s i) ∧
      ∀ i, (Isocrystal.frobenius p k)^[r] (e i) = (p : K(p, k)) ^ a i • e i

/-- Section 0.6: every finite-dimensional isocrystal determines exactly one sigma class.
The fibre over `V` consists of all matrices sigma-conjugate to a representative `b`. -/
theorem wittGL_isocrystal_classes {n : ℕ} (V : Type*) [AddCommGroup V]
    [Isocrystal p k V] [FiniteDimensional K(p, k) V]
    (hdim : Module.finrank K(p, k) V = n) :
    ∃ b : Matrix.GeneralLinearGroup (Fin n) K(p, k),
      ∀ c : Matrix.GeneralLinearGroup (Fin n) K(p, k),
        (letI := wittGLIsocrystal p k c
         Nonempty (IsocrystalEquiv p k (Fin n → K(p, k)) V)) ↔
          (wittGLSigmaSetoid p k n).r b c := by
  sorry

end Perfect

/-- Sections 1.11–1.12: arithmetic sigma classes are classified by their Newton polygons,
with every admissible polygon realized and a positive decent period for every representative. -/
theorem wittGL_newton_classification [IsAlgClosed k] (n : ℕ) :
    ∃ e : Quotient (wittGLSigmaSetoid p k n) ≃ WittGLNewtonPolygon n,
      ∀ (b : Matrix.GeneralLinearGroup (Fin n) K(p, k)) (s : WittGLNewtonPolygon n),
        e (Quotient.mk _ b) = s ↔ wittGLHasNewtonSlopes p k b s.val := by
  sorry

end TauCetiRoadmap.BunGAndNewtonStrata
