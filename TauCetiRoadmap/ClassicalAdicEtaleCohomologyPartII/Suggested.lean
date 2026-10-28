import Mathlib

/-!
# Classical analytic étale cohomology, part II: target signatures

The roadmap is README.md; this file is not the roadmap. It records the roadmap's
headline theorems against the pinned APIs. The characteristic-p monomial root
duality of §3.7 is stated below. None of the geometric headlines below
is statable at these pins. The underlying adic-space carrier and the generic
categories of sheaves and complexes do not supply the required rigid sites or
almost coefficient categories.

- Formal Hartogs and model-independent canonical traces (§§1.1–1.7) is not statable: it lacks admissible formal schemes, their canonical sheaves and formal/generic-fibre comparison functors.
- Integral Faltings trace and trace compatibility (§§2.3–2.9) is not statable: it lacks completed pro-étale structure sheaves, formal specialization and almost dualizing objects.
- Product-polystable root-algebra derived duality (§§3.1–3.7) is not statable: it needs the integral projection trace tr_m⁺, defined through the character decomposition (a theorem); the derived Hom duality is stated through that trace.
- Polystable integral and mod-p local duality (§§3.8–3.10) is not statable: it lacks the ringed formal/pro-étale sites, almost module categories and Faltings trace.
- Wild-quotient descent and local almost Poincaré duality (§§4.2–4.7) is not statable: it lacks finite formal quotient diagrams and the equivariant derived almost nearby-cycle objects.
- Global almost Poincaré duality (§5.2) is not statable: it lacks almost pro-étale cohomology and its global trace.
- Geometric mod-p Poincaré duality (§5.4) is not statable: it lacks rigid étale cohomology with cup product, analytic trace and Tate-twisted Galois action.
- Finite-local-system mod-p Poincaré duality (§5.5) is not statable: it lacks finite local systems on a rigid étale site and their cohomology/evaluation.
- Finite p-power derived Poincaré duality (§5.6) is not statable: it lacks rigid étale derived global sections, coefficient traces and Tate twists.
- Integral derived Poincaré duality (§5.8) is not statable: it lacks completed pro-étale integral global sections and its compatible trace.
- Rational p-adic Poincaré duality (§5.9) is not statable: it lacks rational pro-étale global sections, cup product, trace and Galois-equivariant Tate line.
- Affinoid constructible algebraization and finite-cover generators (§§7.2–7.3) is not statable: it lacks relative rigid analytification, its site comparison and the Zariski-constructible derived subcategories.
- Zariski-constructible proper pushforward (§7.4) is not statable: it lacks rigid étale direct image and locally bounded Zariski-constructible complexes.
- Proper cohomology under arbitrary algebraically closed field extension (§7.5) is not statable: it lacks rigid scalar extension and its canonical map on constructible étale cohomology.
- All-torsion proper base change (§7.6) is not statable: it lacks rigid cartesian squares and the étale derived exchange transformation.
- Heuer’s constant cohomology sheaf (§7.7) is not statable: it lacks the big smooth rigid étale site and the proper higher direct-image sheaf.

The characteristic-p theorem is separate from the integral root-algebra theorem,
whose character decomposition and integral projection trace are library work.
Scheme étale cohomology does not substitute for rigid étale cohomology.
The algebraic perfect-pairing and fixed-vector inputs belong to the suppliers.
-/

namespace TauCetiRoadmap.ClassicalAdicEtaleCohomologyPartII

/-! ## Layer 3: Polystable character duality -/

/-- The characteristic-p normal-crossing hypersurface with n + 1 coordinates. -/
abbrev monomialRootAlgebra (p n : ℕ) :=
  MvPolynomial (Fin (n + 1)) (ZMod p) ⧸
    Ideal.span {∏ i : Fin (n + 1), (MvPolynomial.X i : MvPolynomial (Fin (n + 1)) (ZMod p))}

/-- The normal-crossing relation kills no nonzero constant, so the quotient has characteristic p. -/
instance monomialRootAlgebraCharP (p n : ℕ) : CharP (monomialRootAlgebra p n) p := by
  apply CharP.quotient' p
  intro x hx
  have hle : Ideal.span {∏ i : Fin (n + 1),
      (MvPolynomial.X i : MvPolynomial (Fin (n + 1)) (ZMod p))} ≤
      RingHom.ker MvPolynomial.constantCoeff := by
    apply Ideal.span_le.mpr
    rintro f rfl
    simp
  have hx0 : (x : ZMod p) = 0 := by simpa using hle hx
  simpa using congrArg (MvPolynomial.C : ZMod p → MvPolynomial (Fin (n + 1)) (ZMod p)) hx0

/-- The class of a coordinate monomial in the normal-crossing hypersurface. -/
noncomputable def monomialClass (p n : ℕ) (e : Fin (n + 1) → ℕ) : monomialRootAlgebra p n :=
  ∏ i, (Ideal.Quotient.mk _ (MvPolynomial.X i)) ^ e i

/-- The root-stage module: restrict the hypersurface ring along the m-fold Frobenius. -/
noncomputable def monomialRootModule (p n m : ℕ) [Fact p.Prime] : ModuleCat (monomialRootAlgebra p n) :=
  (ModuleCat.restrictScalars (iterateFrobenius (monomialRootAlgebra p n) p m)).obj
    (ModuleCat.of (monomialRootAlgebra p n) (monomialRootAlgebra p n))

/-- The monomial projection gives derived duality for every Frobenius root stage:
its multiplication adjoint is bijective and all positive Ext groups vanish
(Zavyalov, Theorem 4.3.2, arXiv:2111.01830v3, p. 59). -/
theorem monomial_root_duality (p n m : ℕ) [Fact p.Prime] :
    ∃ τ : monomialRootModule p n m →ₗ[monomialRootAlgebra p n] monomialRootAlgebra p n,
      (∀ e : Fin (n + 1) → ℕ,
        τ (monomialClass p n e) =
          if ∀ i, p ^ m ∣ e i then monomialClass p n (fun i => e i / p ^ m) else 0) ∧
      (∃ adj : monomialRootModule p n m →ₗ[monomialRootAlgebra p n]
          (monomialRootModule p n m →ₗ[monomialRootAlgebra p n] monomialRootAlgebra p n),
        (∀ x y, adj x y = τ (Mul.mul (α := monomialRootAlgebra p n) x y)) ∧
          Function.Bijective adj) ∧
      (∀ k : ℕ, 0 < k → Subsingleton
        (CategoryTheory.Abelian.Ext (monomialRootModule p n m)
          (ModuleCat.of (monomialRootAlgebra p n) (monomialRootAlgebra p n)) k)) := by
  sorry

end TauCetiRoadmap.ClassicalAdicEtaleCohomologyPartII
