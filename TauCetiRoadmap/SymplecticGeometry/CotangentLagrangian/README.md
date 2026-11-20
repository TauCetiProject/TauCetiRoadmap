# Roadmap: cotangent bundles and Lagrangian geometry

**Summary.** This roadmap develops the smooth geometry of cotangent bundles and of Lagrangian
submanifolds. For a real finite-dimensional manifold M, the cotangent bundle T*M carries the
Liouville one-form λ, whose value on a tangent vector v at a covector p is p(dπ v), and the
canonical symplectic form ω = −dλ, which is Σ dqᵢ ∧ dpᵢ in cotangent coordinates. Around these the
roadmap builds isotropic, coisotropic, Lagrangian and exact Lagrangian submanifolds, conormal
bundles, Lagrangian correspondences and generating functions; the polar coordinates of the real and
complex general linear groups and the maximal compact subgroups of GL(n, ℂ) and Sp(2n, ℝ); and the
neighbourhood theorems that say which data along a submanifold determine a symplectic form near it.
Manifolds are Hausdorff, second countable and without boundary, and every neighbourhood statement
is about a map between specified open sets: no theorem produces a global map from a local inverse
function theorem.

The headline theorems are these.

- *Generating functions.* Let Q and Q′ be finite-dimensional manifolds, S a smooth function on an
  open set W ⊆ Q × Q′, and (q₀, Q₀) a point of W at which the mixed Hessian of S, the bilinear form
  d_Q d_q S, is nondegenerate. Then there are open sets U ⊆ T*Q and V ⊆ T*Q′ and a symplectomorphism
  φ : U → V whose graph is the relation p = d_q S(q, Q), P = −d_Q S(q, Q), and which passes through
  (q₀, d_q S(q₀, Q₀)). For a cycle of such maps, the periodic orbits correspond exactly to the
  critical points of the discrete action Σᵢ Sᵢ(qᵢ, qᵢ₊₁).
- *Periodic billiard trajectories.* In a smooth strictly convex planar table, bounded by a closed
  curve each of whose tangent lines meets it only at the point of tangency, there is for every
  N ≥ 2 a closed billiard trajectory with N bounces: N boundary points, consecutive ones distinct,
  satisfying the reflection law at each.
- *Relative Moser and Darboux.* If two symplectic forms on M agree on the whole tangent space at
  every point of a compact submanifold Q, a diffeomorphism between neighbourhoods of Q that fixes Q
  pointwise carries one to the other. If they only have equal pullbacks to Q, then near each point
  of Q a diffeomorphism between neighbourhoods of that point, fixing the nearby points of Q,
  carries one to the other; here Q need not be compact and the pulled-back form may have any
  rank.
- *Weinstein's neighbourhood theorem.* A compact Lagrangian submanifold L of a symplectic manifold
  has a neighbourhood symplectomorphic to a neighbourhood of the zero section of T*L, each point of
  L going to its zero covector. Two coisotropic embeddings of a compact manifold inducing the same
  two-form on it have symplectomorphic neighbourhoods.

The Tau Ceti library supplies the cotangent bundle with its two forms and cotangent lifts, the
tangent-image predicates for isotropic, coisotropic and Lagrangian maps, the theory of generating
functions on normed spaces, the matrix polar decomposition and the maximal compactness of U(n) in
GL(n, ℂ) and in Sp(2n, ℝ); this roadmap builds on them. HeegaardFloer supplies Darboux's theorem
and Moser's theorem on a compact manifold, which Layer 4 refines to statements relative to a
submanifold; DifferentialGeometry supplies the calculus of forms, the homotopy operator and the de
Rham theorem. HamiltonianReduction takes the canonical form for its cotangent momentum maps and the
relative germs for its slices, ContactGeometry the cosphere bundle, IntegrableSystems and
MathematicalBilliards the discrete action and the billiard map, and LieGroups the ambient polar
coordinates.

The layers below are built in order. Layer 1 fixes the cotangent phase space and its identities.
Layer 2 treats the polar coordinates and maximal compact subgroups of the matrix groups, exact
Lagrangians and the basic examples (conormal bundles, cotangent tori, the Kodaira–Thurston manifold,
cosphere bundles), and symplectic, isotropic and coisotropic embeddings. Layer 3 composes Lagrangian
correspondences, turns generating functions on manifolds into local symplectomorphisms, and applies
the discrete action to periodic orbits, convex billiards and recurrence. Layer 4 proves the relative
Poincaré lemma, relative Moser and Darboux theorems, and the symplectic, Lagrangian and coisotropic
neighbourhood theorems.

## Conventions

1. **Manifolds.** The family conventions of [SymplecticGeometry](../README.md) apply. Base
   manifolds are real, finite-dimensional, smooth, boundaryless, Hausdorff and second countable,
   with Mathlib's `ModelWithCorners`, `IsManifold`, `TangentSpace`, `mfderiv` and `Diffeomorph`;
   a statement that needs fewer hypotheses says so. A form is Tau Ceti's `TauCeti.SmoothTwoForm I M`
   (or `TauCeti.SmoothForm I M ℝ k`), symplectic when `TauCeti.SmoothTwoForm.IsSymplectic` holds.
2. **Submanifolds.** A submanifold is given by a smooth embedding (Mathlib's
   `Manifold.IsSmoothEmbedding`) with its own manifold structure, not by a subset. Compactness of
   the embedded manifold is assumed exactly where a conclusion is uniform along it.
3. **Symplectomorphisms of open sets and germs.** A symplectomorphism between open sets U ⊆ M and
   V ⊆ N is a `Diffeomorph` between the `TopologicalSpace.Opens` U and V whose pullback, by
   `TauCeti.SmoothForm.mpullback`, of the restriction of the form of N is the restriction of the
   form of M. A germ along a set A is a class of maps defined on open neighbourhoods of A, two maps
   being identified when they agree on some smaller open neighbourhood of A.
4. **The cotangent bundle and its signs.** T*M is Tau Ceti's `TauCeti.CotangentBundle I M`, the
   total space `Bundle.TotalSpace (E →L[ℝ] ℝ) (fun x ↦ TangentSpace I x →L[ℝ] ℝ)` with model
   `I.prod 𝓘(ℝ, E →L[ℝ] ℝ)`. `Suggested.lean` names these `Cotangent` and `cotangentModel`, and the
   canonical form `canonicalForm`. The Liouville form is λ_(q,p)(v) = p(dπ v), equal to Σ pᵢ dqᵢ in
   a cotangent chart; the canonical form is ω = −dλ, equal to Σ dqᵢ ∧ dpᵢ. With the family
   conventions, the Hamiltonian field of f satisfies ι_(X_f) ω = df, and a Liouville field of an
   exact form ω = −dθ satisfies ι_Z ω = −θ, so that the Euler field p ∂_p of T*M is the Liouville
   field of λ.
5. **Exact Lagrangians.** An exact symplectic manifold carries a chosen smooth one-form θ with
   ω = −dθ. A map i is exact Lagrangian, with primitive h, when it is Lagrangian, h is smooth and
   i*θ = dh: this is Tau Ceti's `TauCeti.SmoothTwoForm.IsNondegenerate.IsExactLagrangianMap`.
6. **Conormals.** The conormal space of a map i : Q → M at q consists of the covectors in T*_(i q) M
   that annihilate the tangent image di_q(T_q Q).
7. **Partial differentials.** For a function S on an open subset of Q × Q′, the partial
   differentials d_q S and d_Q S are Mathlib's `mvfderiv` of the restrictions of S to the two
   factors, and the mixed Hessian at (q, Q) is the bilinear map d_Q(d_q S) on T_Q Q′ × T_q Q, Tau
   Ceti's `TauCeti.mixedHessian`.
8. **Correspondences.** A Lagrangian correspondence L : M ⇝ N is a Lagrangian embedding into M × N
   for the twisted product form ω_M − ω_N, Tau Ceti's `TauCeti.SmoothTwoForm.twistedProd`; M × N̄
   denotes this symplectic manifold.
9. **Matrices.** Real 2n × 2n matrices are indexed by `Fin n ⊕ Fin n`, with Mathlib's
   `Matrix.J (Fin n) ℝ`, the block matrix [[0, −I], [I, 0]]. The pair (x, y) is identified with
   x + iy, so that multiplication by i is J, and the realification of X + iY is
   `Matrix.fromBlocks X (−Y) Y X`. Write GL_R for `(Matrix (Fin n ⊕ Fin n) (Fin n ⊕ Fin n) ℝ)ˣ`,
   GL_C for `(Matrix (Fin n) (Fin n) ℂ)ˣ`, Sp_R for Tau Ceti's `TauCeti.GLSymplectic (Fin n) ℝ`
   (the units whose matrix lies in Mathlib's `Matrix.symplecticGroup (Fin n) ℝ`), O_R for the
   unitary subgroup of GL_R (the units with orthogonal matrix), C_R for the realified image of GL_C,
   and U(n) for Mathlib's `Matrix.unitaryGroup (Fin n) ℂ`. Where the index `Fin (2*n)` is needed,
   reach `Fin (n+n)` by `finSumFinEquiv` and then `Fin (2*n)` by `finCongr (two_mul n).symm`.
10. **Lean names.** `Suggested.lean` states its headline theorems in the namespace
    `TauCetiRoadmap.SymplecticGeometry`, shared with the other files of the family, which state
    their targets against `Cotangent`, `cotangentModel` and `canonicalForm`.

## Layer 1: intrinsic cotangent phase space

The cotangent bundle should be usable intrinsically, in charts, under diffeomorphisms and products.
Its carriers, forms and transport laws are Tau Ceti's, and every intrinsic construction of Layers 2–4
is checked against their chart formulas.

### 1.1 The cotangent bundle

Use Tau Ceti's `TauCeti.CotangentBundle I M` (Convention 4) with the continuous-linear-map bundle
charts. The projection is a submersion, by Tau Ceti's `Bundle.isSubmersion_proj`, which holds for
every fibre bundle over a manifold whose total space is a manifold; the zero section is smooth, by
Mathlib's `Bundle.contMDiff_zeroSection`; and the change from the preferred chart at one covector to
the preferred chart at another is (q, p) ↦ (φ(q), p ∘ (dφ_q)⁻¹), with φ the change of base charts,
by Tau Ceti's `TauCeti.CotangentBundle.extChartAt_extChartAt_symm`. Smooth one-forms are smooth
sections, and fibrewise addition, scaling and the vector-bundle laws are those of Mathlib's
continuous-linear-map bundle. *Needs:* Tau Ceti `TauCeti.CotangentBundle`, `Bundle.isSubmersion_proj`,
`TauCeti.CotangentBundle.extChartAt_extChartAt_symm`; Mathlib `Bundle.contMDiff_zeroSection`.

**Checks.**
- For M = ℝ with its identity chart and the base chart change φ(q) = 2q, a covector p at q is sent
  to the covector p/2 at 2q, the inverse transpose of dφ = 2. Pushing covectors forward by dφ would
  give 2p, which does not preserve the pairing p(v) = (p/2)(2v) of a covector with a tangent vector.

### 1.2 The Liouville and canonical forms

The Liouville form λ(v) = p(dπ v) is Tau Ceti's `TauCeti.CotangentBundle.liouvilleForm`, with the
chart formula Σ pᵢ dqᵢ (`TauCeti.CotangentBundle.inChartAt_liouvilleForm`). It is tautological: its
pullback by the section s_α of a smooth one-form α is α
(`TauCeti.CotangentBundle.mpullback_liouvilleForm`, and pointwise, at every point where s_α is
differentiable, `TauCeti.CotangentBundle.mpullback_liouvilleForm_section`). The canonical form
ω = −dλ is `TauCeti.CotangentBundle.symplecticForm`
(`TauCeti.CotangentBundle.symplecticForm_eq_neg_mextDeriv`), named `canonicalForm` in
`Suggested.lean`; it is closed and nondegenerate
(`TauCeti.CotangentBundle.isSymplectic_symplecticForm`) and equals
`TauCeti.strongDualCotangentSymplecticForm` in every cotangent chart
(`TauCeti.CotangentBundle.inChartAt_symplecticForm_apply`; Cannas da Silva, §§2.2–2.3, pp. 9–10).
Since the chart expression of a form at the chart centre is the form itself
(`TauCeti.RoughForm.inChartAt_extChartAt_self`), this chart identity determines ω, and it is the
evidence that no sign convention has changed. None of these statements needs a finite-dimensional
or boundaryless base. *Needs:* Tau Ceti `TauCeti.CotangentBundle.liouvilleForm`,
`TauCeti.CotangentBundle.symplecticForm` and the identities named above.

**Checks.**
- On T*ℝ with coordinates (q, p), λ = p dq and ω = −d(p dq) = dq ∧ dp, so ω(∂_q, ∂_p) = 1. The
  opposite convention ω = dλ gives −1. For the translation action of ℝ on itself, the lifted field
  is ∂_q and its Hamiltonian is H = p; then ι_(∂_q) ω = dp = dH, and evaluating on ∂_p gives
  1 = dH(∂_p), whereas the opposite sign gives −1.
- The form 2 dq ∧ dp on T*ℝ is symplectic, takes the value 2 on (∂_q, ∂_p) while dH(∂_p) = 1, and
  fails the chart identity: symplecticity alone does not single out the canonical form.

### 1.3 Cotangent lifts and the cotangent relation

The cotangent lift (q, p) ↦ (f(q), p ∘ (df_q)⁻¹) of a diffeomorphism f : M → N is Tau Ceti's
`Diffeomorph.cotangent`, with its identity, composition and inverse laws
(`Diffeomorph.cotangent_refl`, `Diffeomorph.cotangent_trans`, `Diffeomorph.cotangent_symm`); it pulls
λ back to λ and ω back to ω (`Diffeomorph.mpullback_cotangent_liouvilleForm`,
`Diffeomorph.mpullback_cotangent_symplecticForm`). The lift of an action of a group by smooth maps
is again one (`TauCeti.CotangentBundle.instMulAction`,
`TauCeti.CotangentBundle.instContMDiffConstSMul`), jointly smooth for a smooth Lie group action
(`TauCeti.CotangentBundle.instContMDiffSMul`), and every group element preserves both forms
(`TauCeti.CotangentBundle.mpullback_smul_liouvilleForm`,
`TauCeti.CotangentBundle.mpullback_smul_symplecticForm`).

Pullback of covectors along a general smooth map f : M → N is a relation over f, not a map
T*M → T*N, since df need not be invertible: Tau Ceti's `TauCeti.CotangentBundle.cotangentRel`
relates (x, p) to (f(x), q) when p = q ∘ df_x. The relation of the identity is equality
(`TauCeti.CotangentBundle.cotangentRel_id_iff`); the relation of g ∘ f is the composite of the
relations whenever f is differentiable at x and g at f(x)
(`TauCeti.CotangentBundle.cotangentRel_comp_iff`); for a diffeomorphism it is the graph of the
cotangent lift (`TauCeti.CotangentBundle.cotangentRel_diffeomorph_iff`); and a constant map relates
each zero covector to the whole fibre over its value and a nonzero covector to nothing
(`TauCeti.CotangentBundle.cotangentRel_const_iff`). *Needs:* Tau Ceti `Diffeomorph.cotangent`,
`TauCeti.CotangentBundle.cotangentRel` and the laws named above.

**Checks.**
- The dilation f(x) = 2x of ℝ lifts to (q, p) ↦ (2q, p/2), which pulls λ = p dq back to
  (p/2) d(2q) = p dq. The plausible wrong lift (q, p) ↦ (2q, 2p) pulls λ back to 4 p dq.
- For nonempty M and N of positive dimension, the relation of a constant map is the graph of no map
  in either direction: from T*M, a zero covector is related to a whole fibre of positive dimension
  and a nonzero covector to nothing; from T*N, a covector over the value is related to the zero
  covectors at all the points of M, and a covector over another point to nothing.
- The relation of the covering ℝ → ℝ/2πℤ is the graph of a local diffeomorphism T*ℝ → T*(ℝ/2πℤ),
  (x, p) ↦ ([x], p), which has local inverses but no global one: the covectors p at x and at x + 2π
  have the same image.

### 1.4 Open restriction, products, fibre translation and dilation

Use Tau Ceti's four identities. The open-restriction diffeomorphism T*U ≅ π⁻¹(U),
`TauCeti.CotangentBundle.restrictOpen`, identifies the Liouville and canonical forms
(`TauCeti.CotangentBundle.mpullback_restrictOpen_liouvilleForm`,
`TauCeti.CotangentBundle.mpullback_restrictOpen_symplecticForm`). The diffeomorphism
T*(M × N) ≅ T*M × T*N, `TauCeti.CotangentBundle.prodDiffeomorph`, pulls the sum of the Liouville
forms and the product of the canonical forms back to those of M × N
(`TauCeti.CotangentBundle.mpullback_prodDiffeomorph_liouvilleForm`,
`TauCeti.CotangentBundle.mpullback_prodDiffeomorph_symplecticForm`). Fibre translation by a smooth
one-form α changes λ to λ + π*α and ω to ω − π*dα, and is symplectic exactly when dα = 0
(`TauCeti.CotangentBundle.mpullback_vectorBundleTranslateDiffeomorph_liouvilleForm`,
`TauCeti.CotangentBundle.mpullback_vectorBundleTranslateDiffeomorph_symplecticForm`,
`TauCeti.CotangentBundle.mpullback_vectorBundleTranslateDiffeomorph_symplecticForm_eq_self_iff`).
Fibre dilation by c ≠ 0 multiplies λ and ω by c, so fibre negation changes both signs
(`TauCeti.CotangentBundle.mpullback_vectorBundleScalarDiffeomorph_liouvilleForm`,
`TauCeti.CotangentBundle.mpullback_vectorBundleScalarDiffeomorph_symplecticForm`).

Prove that the translation and dilation formulas hold on every open restriction: for an open U ⊆ M
and a smooth one-form α on M, fibre translation by α restricted to π⁻¹(U), read on T*U through
`TauCeti.CotangentBundle.restrictOpen`, is fibre translation by the restriction of α to U, and
changes the Liouville and canonical forms of T*U by the restrictions of π*α and −π*dα; likewise for
fibre dilation by c ≠ 0. *Route:* transport the global formulas along
`TauCeti.CotangentBundle.restrictOpen`, using its two form identities. *Needs:* Tau Ceti
`TauCeti.CotangentBundle.restrictOpen` and the translation and dilation identities named above.

**Checks.**
- On T*ℝ² with coordinates (x, y, p_x, p_y), translation by the non-closed form α = x dy is
  (x, y, p_x, p_y) ↦ (x, y, p_x, p_y + x); it pulls ω = dx ∧ dp_x + dy ∧ dp_y back to
  ω + dy ∧ dx = ω − dx ∧ dy = ω − π*dα. A sign slip gives ω + π*dα. Translation by the closed form
  dy preserves ω.

### Examples

- T*ℝⁿ = ℝⁿ × (ℝⁿ)* with λ = Σ pᵢ dqᵢ and ω = Σ dqᵢ ∧ dpᵢ; a linear isomorphism A of ℝⁿ lifts to
  (q, p) ↦ (Aq, p ∘ A⁻¹), and the lift of a rotation of ℝ² is the rotation of both factors.
- The cotangent bundle of the circle ℝ/2πℤ is the cylinder (ℝ/2πℤ) × ℝ with ω = dθ ∧ dp; fibre
  translation by the closed, non-exact form dθ is (θ, p) ↦ (θ, p + 1), a symplectomorphism that is
  not the cotangent lift of any diffeomorphism of the circle, since it does not preserve λ.

### Dependencies

Tau Ceti: the cotangent bundle, its charts, the Liouville and canonical forms, cotangent lifts and
relations, and the open-restriction, product, translation and dilation identities. Mathlib: smooth
manifolds, vector bundles and the zero section.

## Layer 2: embedded Lagrangians, linear groups and basic examples

<a id="c20-elementary-matrix-polar-package"></a>

### 2.0 Elementary matrix polar package

Over ℝ and ℂ, the elementary matrix polar package is Tau Ceti's and is independent of LieGroups
Layers 7 and 9. Every invertible A is uniquely A = PU with P positive definite and U unitary
(orthogonal over ℝ), where P = (AA*)^(1/2)
(`Matrix.GeneralLinearGroup.existsUnique_posDef_mul_unitary`); for det A = 1, every real power of P
and the factor U have determinant 1 (`Matrix.GeneralLinearGroup.det_rpow_sqrt_mul_star_of_det_eq_one`,
`Matrix.GeneralLinearGroup.det_polarUnitary_of_det_eq_one`). The logarithm `cfc Real.log` inverts the
exponential on Hermitian (over ℝ, symmetric) matrices, the exponential inverts it on positive
definite ones, and it is smooth on the positive definite matrices (`Matrix.IsHermitian.cfc_log_exp`,
`Matrix.PosDef.exp_cfc_log`, `Matrix.contDiffOn_cfc_log`). Both factors depend smoothly on A
(`Matrix.GeneralLinearGroup.contMDiff_sqrt_mul_star`,
`Matrix.GeneralLinearGroup.contMDiff_coe_polarUnitary`). The contraction A ↦ P^(1−t) U,
`Matrix.GeneralLinearGroup.polarDeformation`, is jointly smooth in t and A
(`Matrix.GeneralLinearGroup.contMDiff_polarDeformation`), fixes every unitary matrix, is equivariant
under unitary multiplication on both sides, in particular under the central action of ±I
(`Matrix.GeneralLinearGroup.polarDeformation_unitary_mul_mul_unitary`), and gives the homotopy
`Matrix.GeneralLinearGroup.polarHomotopy` from the identity to the unitary retraction, relative to
the unitary subgroup.

Construct the two smooth ambient polar-coordinate diffeomorphisms. For real invertible matrices,
A = PU = U(UᵀPU) with U orthogonal and P, UᵀPU positive definite symmetric; for complex invertible
matrices, A = PU = U(U*PU) with U unitary and P, U*PU positive definite Hermitian. Each is a
diffeomorphism from the invertible matrices onto the product of the open set of positive definite
matrices (in the symmetric, respectively Hermitian, matrices) with the orthogonal, respectively
unitary, group, the latter with its structure of embedded Lie subgroup (Tau Ceti's
`TauCeti.Lie.isEmbeddedLieSubgroup_unitarySubgroup`), and its inverse is (P, U) ↦ PU. Prove that
both are equivariant for unitary multiplication, (P, U) ↦ (VPV*, VUW) for A ↦ VAW, and that they
restrict to diffeomorphisms from the matrices of determinant one onto the product of the positive
definite matrices of determinant one with the special orthogonal, respectively special unitary,
group. For the orthogonal-left form of GL_n(ℝ), A = U(UᵀPU), use the symmetric logarithm of UᵀPU.
*Route:* smoothness of both directions comes from the smooth factors above and from
multiplication. *Needs:* Tau Ceti `Matrix.GeneralLinearGroup.existsUnique_posDef_mul_unitary`,
`Matrix.GeneralLinearGroup.contMDiff_sqrt_mul_star`,
`Matrix.GeneralLinearGroup.contMDiff_coe_polarUnitary`,
`Matrix.GeneralLinearGroup.det_rpow_sqrt_mul_star_of_det_eq_one`,
`Matrix.GeneralLinearGroup.det_polarUnitary_of_det_eq_one`, `Matrix.contDiffOn_cfc_log`,
`TauCeti.Lie.isEmbeddedLieSubgroup_unitarySubgroup`.

LieGroups Layers 7 and 9 consume these ambient polar maps, and each of those layers proves
preservation for its own closed subgroups; for Sp_R the preservation is Tau Ceti's, used in §2.1.

**Checks.**
- A = [[0, −2], [1/2, 0]] has AAᵀ = diag(4, 1/4), so P = diag(2, 1/2) and U = P⁻¹A = [[0, −1], [1, 0]],
  a rotation; the right factor is UᵀPU = diag(1/2, 2) = (AᵀA)^(1/2), and A = U · diag(1/2, 2). A
  definition taking (AᵀA)^(1/2) as the left factor would pair diag(1/2, 2) with
  diag(2, 1/2) · A = [[0, −4], [1/4, 0]], which is not orthogonal. Here det A = 1, and both factors
  have determinant 1, as the restriction to determinant one requires.
- At t = 1/2 the polar deformation of this A is diag(√2, 1/√2) · U, and at t = 1 it is U.

<a id="c21-compact-intersections-and-group-applications"></a>

### 2.1 Compact intersections and group applications

Use Mathlib's matrix submonoids `Matrix.symplecticGroup (Fin n) ℝ`,
`Matrix.orthogonalGroup (Fin n ⊕ Fin n) ℝ` and `Matrix.unitaryGroup (Fin n) ℂ`, the units carriers
GL_R and GL_C, and the index and J of Convention 9. Use Mathlib's `Unitary.toUnits`, specialized to
`Matrix (Fin n) (Fin n) ℂ`, for the inclusion U(n) → GL_C. Use Mathlib's `SymplecticGroup.mem_iff`,
`SymplecticGroup.mem_iff'` and `SymplecticGroup.transpose_mem_iff` for AJAᵀ = J and AᵀJA = J, and
`Matrix.mem_orthogonalGroup_iff` and `Matrix.mem_orthogonalGroup_iff'` for orthogonality.
Commutation with J turns the symplectic identity into AAᵀ = 1, and orthogonality gives the
converse; this is the content of the intersection identities below.

*Realification.* Use Tau Ceti's `Matrix.realify`, realify(X + iY) = `Matrix.fromBlocks X (−Y) Y X`:
an injective ℝ-algebra homomorphism (`Matrix.realifyAlgHom`, `Matrix.realify_injective`) that sends
conjugate transpose to transpose (`Matrix.realify_conjTranspose`), whose values commute with J
(`Matrix.commute_J_realify`) and whose image is exactly the matrices commuting with J
(`Matrix.commute_J_iff_exists_realify_eq`). The induced map on units GL_C → GL_R is Tau Ceti's
`Matrix.GeneralLinearGroup.realify`, a closed embedding
(`Matrix.GeneralLinearGroup.isClosedEmbedding_realify`), hence an isomorphism of topological groups
onto its image (`Matrix.GeneralLinearGroup.realifyEquivRange`), and that image is the closed
subgroup of units commuting with J (`Matrix.GeneralLinearGroup.mem_range_realify_iff`). Mathlib's
`Matrix.UnitaryGroup.embeddingGL` is not used as a topological embedding: its comparison through
the equivalence of matrices with linear maps is algebraic only.

*The three groups and their intersections.* In GL_R, Sp_R and O_R are closed
(`TauCeti.isClosed_GLSymplectic`, `TauCeti.isClosed_unitarySubgroup_units`), and C_R is closed by the
closed embedding above. The three pairwise intersections Sp_R ∩ O_R, Sp_R ∩ C_R and C_R ∩ O_R are
each equal, as subgroups of GL_R, to the realified image of the unitary subgroup of GL_C
(`TauCeti.GLSymplectic.inf_unitarySubgroup`, `TauCeti.GLSymplectic.inf_range_realify`,
`Matrix.GeneralLinearGroup.unitarySubgroup_inf_range_realify`; on matrices,
`Matrix.symplecticGroup_inf_orthogonalGroup`), and realification is an isomorphism of topological
groups from U(n) onto Sp_R ∩ O_R (`Matrix.unitaryGroupEquivSymplecticInfOrthogonal`). U(n) is
compact in GL_C (`Matrix.GeneralLinearGroup.isCompact_unitarySubgroup`) and so is its realified
image Sp_R ∩ O_R in GL_R (`TauCeti.GLSymplectic.isCompact_inf_unitarySubgroup`); these are used
rather than compactness from entry bounds.

*Polar factors of symplectic matrices.* For a positive semidefinite symplectic S,
S^(−s) = J S^s J⁻¹ for every real s (`SymplecticGroup.rpow_neg_eq_J_conj_rpow`), so every real power
of S is symplectic (`SymplecticGroup.rpow_mem`). For A = PU ∈ Sp_R both P and U are symplectic
(`SymplecticGroup.sqrt_mul_star_mem`, `SymplecticGroup.polarUnitary_mem`), so U lies in Sp_R ∩ O_R,
the realified U(n), and t ↦ P^(1−t) U is a path of symplectic matrices from A to U
(`SymplecticGroup.joinedIn_polarUnitary`).

*Connectedness and maximal compactness.* U(n), GL(n, ℂ) and Sp(2n, ℝ) are path connected, n = 0
included (`Matrix.UnitaryGroup.instPathConnectedSpace` for `Matrix.unitaryGroup (Fin n) ℂ`,
`TauCeti.instPathConnectedSpaceMatrixGeneralLinearGroup` for the units of the complex matrix
algebra, `Matrix.isPathConnected_symplecticGroup` for the symplectic matrices as a subset of the
real matrices). U(n) is maximal among the compact subgroups of GL_C: the unitary subgroup of
`GL (Fin n) ℂ`, the range of `Unitary.toUnits`, is compact and every compact subgroup containing it
equals it (`Matrix.GeneralLinearGroup.isCompact_unitarySubgroup`,
`Matrix.GeneralLinearGroup.eq_unitarySubgroup_of_isCompact_of_le`). The proof is trace growth on the
positive polar factor: if a compact K contains U(n) and A = PU ∈ K, then P = AU⁻¹ ∈ K; if P ≠ 1,
then after replacing P by P⁻¹ it has an eigenvalue μ > 1, and Re tr(Pᵏ) = Σᵢ μᵢᵏ ≥ μᵏ is unbounded
on K, whereas the trace is bounded on the compact K. The realified U(n) = Sp_R ∩ O_R is maximal
among the compact subgroups of Sp_R: a compact subgroup of `GL (Fin n ⊕ Fin n) ℝ` contained in
Sp_R and containing its orthogonal elements equals their intersection
(`TauCeti.GLSymplectic.eq_inf_unitarySubgroup_of_isCompact_of_le`; as maximality,
`TauCeti.GLSymplectic.maximal_isCompact_unitarySubgroup`), and that intersection is the
realification of U(n) (`Matrix.GeneralLinearGroup.range_realify_comp_toUnits`), by the same trace
growth applied to the symplectic positive polar factor. LieGroups Layer 7 owns the general
compact-complexification theorem.

*Structure of Sp_R.* For n ≥ 1 the centre of Sp_R is {±I}: in positive rank the centre consists of
the scalar matrices whose scalar squares to one, over any commutative ring, on the index
`Fin (n+n)` (`TauCeti.GLSymplecticFin.mem_center_iff`, for Tau Ceti's `TauCeti.GLSymplecticFin`,
identified with Sp_R by `TauCeti.GLSymplecticFin.mulEquivGLSymplectic`). The map θ(A) = A⁻ᵀ is an
involutive automorphism of Sp_R, namely conjugation by J, whose fixed points are the orthogonal
symplectic matrices (`TauCeti.GLSymplectic.cartanInvolution`,
`TauCeti.GLSymplectic.coe_cartanInvolution`, `TauCeti.GLSymplectic.cartanInvolution_eq_self_iff`);
it is smooth for every Lie group structure on Sp_R (`TauCeti.GLSymplectic.contMDiff_cartanInvolution`).
The Lie algebra of Sp_R is Mathlib's `LieAlgebra.Symplectic.sp (Fin n) ℝ`
(`TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff_mem_sp`); it has trivial
radical, so it is semisimple (`TauCeti.hasTrivialRadical_sp`); the differential of θ is
dθ(X) = −Xᵀ (`TauCeti.GLSymplectic.mfderiv_conj_symJ_one_apply`); its Killing form is
B(X, Y) = (2n + 2) tr(XY) (`LieAlgebra.Symplectic.killingForm_apply`); and
−B(X, dθ X) = (2n + 2) tr(XXᵀ) > 0 for X ≠ 0
(`LieAlgebra.Symplectic.killingForm_cartanInvolution_self_neg`).

Prove the following.

1. *Reindexing.* The identities transporting J, `Matrix.symplecticGroup`, `Matrix.orthogonalGroup`
   and the realified image along `Matrix.reindex` from `Fin n ⊕ Fin n` to `Fin (2*n)`, through
   `finSumFinEquiv` and `finCongr (two_mul n).symm`; the first step is Tau Ceti's
   `TauCeti.GLSymplecticFin` with `TauCeti.JFin`.
2. *Topologies.* On Sp_R, O_R and U(n), the subspace topology of the matrix submonoid
   (`Matrix.symplecticGroup`, `Matrix.orthogonalGroup`, `Matrix.unitaryGroup`) agrees with the
   topology of the subgroup of units: the identification of each submonoid with the corresponding
   subgroup of GL_R or GL_C is a homeomorphism. *Route:* continuity of `Units.val` and of the
   inverse, with the explicit inverses A⁻¹ = −J AᵀJ on Sp_R (`SymplecticGroup.inv_eq_symplectic_inv`,
   `SymplecticGroup.coe_inv'`), A⁻¹ = Aᵀ on O_R and U⁻¹ = U* on U(n)
   (`Matrix.UnitaryGroup.inv_val`).
3. *Connectedness of C_R.* C_R is connected, as the image of the path-connected GL(n, ℂ) under the
   continuous map `Matrix.GeneralLinearGroup.realify`.
4. *Lie subgroup structures.* Sp_R and C_R are embedded Lie subgroups of GL_R by the closed-subgroup
   theorem (Tau Ceti's `TauCeti.Lie.isEmbeddedLieSubgroup_of_isClosed`, the theorem of LieGroups
   Layer 2) and their closedness; O_R and U(n) are by `TauCeti.Lie.isEmbeddedLieSubgroup_unitarySubgroup`.
   Identify the embedded structures through the topological group isomorphisms
   `Matrix.GeneralLinearGroup.realifyEquivRange` and
   `Matrix.unitaryGroupEquivSymplecticInfOrthogonal`: these are diffeomorphisms.
5. *The adjoint model of Sp_R.* For n ≥ 1, apply the adjoint-model construction of LieGroups Layer 9
   to Sp_R with the positive Cartan metric −B(X, dθ Y) and the finite centre {±I}. Identify its
   compact adjoint subgroup with Ad(U(n)) and prove Ad⁻¹(Ad(U(n))) = U(n), using that the central
   kernel {±I} lies in U(n). Give the matrix comparison: if A = PU and Ad(A) is orthogonal for the
   Cartan metric, then Ad(P) is both positive self-adjoint and orthogonal, hence the identity, and
   positivity of P with the central-kernel calculation forces P = 1. These structural and adjoint
   comparisons are not hypotheses of the trace-growth proofs above.
6. *Matrix models.* Give the matrix-model specializations of LieGroups Layer 9 for H = C_R and for
   H = Sp_R, both with π = id: prove closedness and transpose stability of H in GL_(2n)(ℝ), use the
   connectedness above, and identify K_H = H ∩ O(2n) with the realified U(n). Apply the generic
   matrix-model theorem and compare its polar and maximality maps with the direct proofs above. No
   semisimplicity or finite-centre hypothesis is imposed on GL(n, ℂ).

The construction order is §2.0, then the concrete matrix, preservation, connectedness and direct
maximality results, then items 4–6. The generic theorems of LieGroups Layer 9 are that roadmap's,
and the results of this section before item 4 do not depend on them.
*Needs:* §2.0; Tau Ceti `Matrix.realify`, `Matrix.GeneralLinearGroup.realify` and the
realification, intersection, compactness, polar-preservation, connectedness and maximality
declarations named above, `TauCeti.GLSymplecticFin`, `TauCeti.Lie.isEmbeddedLieSubgroup_of_isClosed`,
`TauCeti.Lie.isEmbeddedLieSubgroup_unitarySubgroup`, `TauCeti.hasTrivialRadical_sp`,
`LieAlgebra.Symplectic.killingForm_apply`; Mathlib `Matrix.symplecticGroup`,
`Matrix.orthogonalGroup`, `Matrix.unitaryGroup`, `Unitary.toUnits`; for items 5 and 6,
LieGroups Layer 9.

**Checks.**
- For n = 1, Sp(2, ℝ) = SL₂(ℝ), and each pairwise intersection is SO(2), the realification of
  U(1): realify(e^(iθ)) = [[cos θ, −sin θ], [sin θ, cos θ]]. No single condition suffices:
  diag(1, −1) is orthogonal but neither symplectic (determinant −1) nor commuting with J;
  diag(2, 1/2) is symplectic but neither orthogonal nor commuting with J; realify(2) = 2I commutes
  with J but is neither symplectic nor orthogonal.
- For n = 1 the Killing form formula gives B(X, Y) = 4 tr(XY), the classical Killing form of
  sl₂(ℝ) = sp(2, ℝ). For n = 2 it gives 6 tr(XY), whereas the restriction to sp(4, ℝ) of the Killing
  form 8 tr(XY) of sl₄(ℝ) is different: the Killing form of a subalgebra is not the restriction of
  the ambient one.
- C_R for n = 1 is {[[x, −y], [y, x]] : (x, y) ≠ (0, 0)} ≅ ℂ*, connected, whereas GL₂(ℝ), which
  contains it, has two components; −I = realify(−1) lies in U(1), as item 5 uses.

<a id="c22-exact-lagrangians-and-basic-examples"></a>

### 2.2 Exact Lagrangians and basic examples

*Exact Lagrangians.* Use Tau Ceti's `TauCeti.SmoothTwoForm.IsNondegenerate.IsExactLagrangianMap`
(Convention 5). Two primitives differ by a constant on a preconnected source
(`TauCeti.SmoothTwoForm.IsNondegenerate.IsExactLagrangianMap.exists_eq_add_const`), and an exact
symplectomorphism transports exact Lagrangian maps, the primitive shifting by the pulled-back
function (`Diffeomorph.isExactLagrangianMap_comp_iff`). For the cotangent bundle of a
finite-dimensional manifold, the zero section is exact Lagrangian with primitive 0
(`TauCeti.CotangentBundle.isExactLagrangianMap_zeroSection`), the graph of a smooth one-form α is
Lagrangian exactly when dα = 0 (`TauCeti.CotangentBundle.isLagrangianMap_section_iff`), and it is
exact Lagrangian for some primitive exactly when α is exact
(`TauCeti.CotangentBundle.exists_isExactLagrangianMap_section_iff`).

Prove: if Q is a compact boundaryless manifold with at least two points and f : Q → ℝ is smooth,
the graph of df meets the zero section of T*Q in at least two distinct points. *Route:* the minimum
and the maximum of f when f is not constant, and all of Q when it is. *Needs:* Mathlib
`IsCompact.exists_isMinOn`, `IsCompact.exists_isMaxOn`, and `IsLocalMin.fderiv_eq_zero` and
`IsLocalMax.fderiv_eq_zero` read in a chart, which on a boundaryless manifold is open.

*Conormal bundles.* The conormal set of a map i : Q → M is Tau Ceti's
`TauCeti.CotangentBundle.conormal`, whose fibre over q is the annihilator of the tangent image,
`TauCeti.CotangentBundle.conormalSpace`; where di_q is injective and M is finite-dimensional, that
fibre has dimension dim M − dim Q (`TauCeti.CotangentBundle.finrank_add_finrank_conormalSpace`). The
conormal set does not depend on the parametrization (`TauCeti.CotangentBundle.conormal_comp_diffeomorph`)
and is carried by cotangent lifts (`TauCeti.CotangentBundle.image_cotangent_conormal`); the conormal
set of the identity is the zero section and that of a constant map is the fibre over its value
(`TauCeti.CotangentBundle.conormal_id`, `TauCeti.CotangentBundle.conormal_const`). Every smooth map
into T*M with injective differentials, from a manifold of the dimension of M, whose covectors
annihilate the tangent images of i, is exact Lagrangian with primitive 0
(`TauCeti.CotangentBundle.isExactLagrangianMap_of_conormal`).

Construct, for a smooth embedding i : Q → M into a finite-dimensional M, the conormal bundle N*Q: a
smooth vector subbundle of the pullback of T*M along i whose fibre at q is
`TauCeti.CotangentBundle.conormalSpace` at q, with total space a smooth manifold. Prove that the map
from N*Q to T*M is a smooth embedding, from a manifold of dimension dim M, with image the conormal
set, and that λ pulls back to zero on N*Q; conclude that it is exact Lagrangian with primitive 0 by
`TauCeti.CotangentBundle.isExactLagrangianMap_of_conormal`. *Needs:* Tau Ceti
`TauCeti.CotangentBundle.conormalSpace`, `TauCeti.CotangentBundle.finrank_add_finrank_conormalSpace`,
`TauCeti.CotangentBundle.isExactLagrangianMap_of_conormal`; SmoothBundlesConnections §B1.2
(pullbacks) and §B2.1 (dual bundles).

*Graphs and canonical relations.* A diffeomorphism φ : M → N has a Lagrangian graph in M × N̄
exactly when it is symplectic (`TauCeti.SmoothTwoForm.IsNondegenerate.isLagrangianEmbedding_graph_iff`,
for the form `TauCeti.SmoothTwoForm.twistedProd`); the diagonal is the case of the identity
(`TauCeti.SmoothTwoForm.IsNondegenerate.isLagrangianEmbedding_diagonal`). Prove the converse
direction for relations: if j : L → M × N is a Lagrangian embedding for ω_M − ω_N whose
compositions with the two projections are diffeomorphisms, then L is the graph of the
symplectomorphism pr₂ ∘ j ∘ (pr₁ ∘ j)⁻¹; if the two compositions are only local diffeomorphisms at a
point l, the same formula gives a symplectomorphism between open neighbourhoods of pr₁(j l) and
pr₂(j l), and nothing more. *Needs:* Tau Ceti
`TauCeti.SmoothTwoForm.IsNondegenerate.isLagrangianEmbedding_graph_iff`; Mathlib's inverse function
theorem on manifolds.

*The Liouville field.* On an exact symplectic manifold the Liouville field Z is fixed by
ι_Z ω = −θ, and its Lie derivative satisfies L_Z ω = ω. On T*M it is the Euler field of the bundle,
with ι_Z ω = −λ (`TauCeti.CotangentBundle.symplecticForm_interior_vectorBundleEulerField`), it is a
Liouville vector field of the canonical form
(`TauCeti.CotangentBundle.isLiouvilleVectorField_vectorBundleEulerField`, for Tau Ceti's predicate
`TauCeti.IsLiouvilleVectorField`), and its flow is (q, p) ↦ (q, eᵗ p)
(`TauCeti.isMIntegralCurve_vectorBundleEulerField`). A complete C² Liouville field has a flow with
ψₜ*ω = eᵗ ω and, for its primitive, ψₜ*θ = eᵗ θ
(`TauCeti.IsLiouvilleVectorField.mpullback_globalFlow_eq_exp_smul`,
`TauCeti.mpullback_globalFlow_eq_exp_smul_of_interior_eq`), and a symplectomorphism preserving θ
commutes with the local Liouville flow (`Diffeomorph.apply_flowOf_of_interior_eq`). Prove the
rescaling for the local flow: for a C² vector field Z with L_Z ω = ω, not assumed complete, with
maximal flow ψ, ψₜ*ω = eᵗ ω on the open set where ψₜ is defined, and if moreover ι_Z ω = −θ, also
ψₜ*θ = eᵗ θ there. *Needs:* Tau Ceti
`TauCeti.IsLiouvilleVectorField`, `TauCeti.mpullback_globalFlow_eq_exp_smul`; DifferentialGeometry
Layer 3 (flows).

On the full cotangent total space, the zero section included, every smooth λ-preserving
diffeomorphism T*M → T*N is the cotangent lift of a unique diffeomorphism M → N
(`Diffeomorph.existsUnique_cotangent_eq_of_mpullback_liouvilleForm`, with the converse
`Diffeomorph.exists_cotangent_eq_iff_mpullback_liouvilleForm`); no such classification is asserted
on the complement of the zero section.

*Surfaces and cotangent tori.* On a surface, a two-form is symplectic exactly when it vanishes
nowhere (`TauCeti.SmoothTwoForm.isSymplectic_iff_forall_ne_zero_of_finrank_eq_two`), closedness
being automatic in dimension two, and such an area form orients the surface
(`TauCeti.Manifold.Orientation.ofTopForm`). On the cotangent bundle of a torus, the graph of a
coordinate angle form is Lagrangian and admits no exact-Lagrangian primitive
(`TauCeti.CotangentBundle.isLagrangianMap_section_torusTimeForm`,
`TauCeti.CotangentBundle.not_exists_isExactLagrangianMap_section_torusTimeForm`); these are the tests
of closed non-exact graphs against the zero section.

*The Kodaira–Thurston manifold.* Construct the compact symplectic manifold that is not Kähler:
the quotient of the Heisenberg group H(3, ℝ) by its integer lattice H(3, ℤ), times a circle, as a
smooth manifold by the free proper quotient charts of SmoothBundlesConnections §B1.4. Identify its
universal cover and deck group by UniversalCovers Stages 1–2 (the isomorphism of the deck group of
the universal cover with π₁, the lifting criterion and the Galois correspondence), compute
π₁ = H(3, ℤ) × ℤ through that correspondence, then H₁ = π₁^ab ≅ ℤ³ by Tau Ceti's degree-one
Hurewicz isomorphism for a path-connected space (`TauCeti.HurewiczOne.hurewiczHomologyAddEquiv`), and
identify b₁ = 3 by the de Rham theorem of DifferentialGeometry Layer 8. Construct its closed
nondegenerate two-form, and prove that it carries no Kähler structure because b₁ is odd, from the
parity of odd Betti numbers of compact Kähler manifolds of ComplexKahlerGeometry §6.3 (K6.1), with
its degree-one harmonic and type decomposition and conjugation symmetry; that parity is not a
consequence of de Rham theory alone. *Needs:* SmoothBundlesConnections §B1.4; UniversalCovers
Stages 1–2; Tau Ceti `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv`; DifferentialGeometry Layer 8;
ComplexKahlerGeometry §6.3.

*Cosphere bundles.* For a Riemannian manifold Q of positive dimension, the unit cosphere bundle is
Tau Ceti's `TauCeti.CotangentBundle.cosphereBundle`. ContactGeometry CG1 owns the contact
predicate; the statements below use its form at the pin, Tau Ceti's
`TauCeti.SmoothForm.IsContactForm`. The
boundary form α_b = −λ|S*Q, for which ι_Z ω = −λ with the outward radial Liouville field Z, is
contact (`TauCeti.CotangentBundle.isContactForm_mpullback_neg_liouvilleForm_cosphereBundle`), and so
is its negative α_g = λ|S*Q, which defines the opposite coorientation
(`TauCeti.CotangentBundle.isContactForm_mpullback_liouvilleForm_cosphereBundle`). The Reeb field of
α_g is the Hamiltonian field of the kinetic energy and its flow is the forward unit cogeodesic flow
(`TauCeti.CotangentBundle.mfderiv_coe_reebVectorField_cosphereBundle`,
`TauCeti.CotangentBundle.coe_flowOf_reebVectorField_cosphereBundle`), and R_(α_b) = −R_(α_g)
(`TauCeti.CotangentBundle.mfderiv_coe_reebVectorField_neg_cosphereBundle`). The positive radial
identification `Diffeomorph.cosphereRadial` between the cosphere bundles of two metrics pulls each
of these forms back to a positive multiple of the corresponding form, preserving its contact
hyperplanes and its coorientation (`Diffeomorph.kerDistribution_mpullback_cosphereRadial_liouvilleForm`,
`Diffeomorph.pos_mpullback_cosphereRadial_liouvilleForm_iff`,
`Diffeomorph.pos_mpullback_cosphereRadial_neg_liouvilleForm_iff`).

**Checks.**
- On the circle ℝ/2πℤ with f = cos θ, the graph of df = −sin θ dθ meets the zero section exactly at
  θ = 0 and θ = π, so two is sharp. On the noncompact ℝ with f(x) = x the graph of dx misses the
  zero section, and on the circle the graph of the closed non-exact form dθ misses it: compactness
  and exactness are both needed.
- For the coordinate subspace Q = ℝᵏ × {0} ⊂ ℝⁿ, N*Q = {(x, 0; 0, η)}, of dimension k + (n − k) = n,
  and λ = Σ pᵢ dqᵢ vanishes on it, since pᵢ = 0 for i ≤ k and dqᵢ = 0 for i > k. For a point the
  conormal bundle is the cotangent fibre and for Q = M it is the zero section.
- On T*ℝ the Euler field p ∂_p has ι_(p ∂_p)(dq ∧ dp) = −p dq = −λ, and its flow
  (q, p) ↦ (q, eᵗ p) pulls dq ∧ dp back to eᵗ dq ∧ dp and fixes the zero section pointwise. The
  field q ∂_q is also Liouville for ω, since d(ι_(q ∂_q) ω) = d(q dp) = ω, but for the primitive
  −q dp: ι_(q ∂_q) ω = q dp ≠ −λ, and its flow (q, p) ↦ (eᵗ q, p) moves the points of the zero
  section.
- For the Kodaira–Thurston manifold, H(3, ℤ)^ab ≅ ℤ², so H₁ ≅ ℤ³ and b₁ = 3 is odd; for the
  four-torus b₁ = 4.
- For Q = ℝ, the unit cosphere bundle is {p = ±1}, α_g = λ restricts to ±dq, and its Reeb field is
  ±∂_q: the cogeodesic flow moves q with velocity p.

### 2.3 Tangent-image predicates and embeddings

The tangent-image predicates of a map into a manifold with a nondegenerate two-form are Tau Ceti's
`TauCeti.SmoothTwoForm.IsNondegenerate.HasSymplecticTangentImages` (every tangent image meets its
symplectic orthogonal in zero, equivalently carries a nondegenerate restriction),
`TauCeti.SmoothTwoForm.IsNondegenerate.IsIsotropicMap`,
`TauCeti.SmoothTwoForm.IsNondegenerate.IsCoisotropicMap` and
`TauCeti.SmoothTwoForm.IsNondegenerate.IsLagrangianMap`, each stated through the linear predicate.
A Lagrangian embedding is Tau Ceti's `TauCeti.SmoothTwoForm.IsNondegenerate.IsLagrangianEmbedding`,
a smooth immersion that is a topological embedding with Lagrangian tangent images, which on smooth
embeddings is the tangent-image condition alone
(`TauCeti.SmoothTwoForm.IsNondegenerate.isLagrangianEmbedding_iff_of_isSmoothEmbedding`). A
Lagrangian immersion is the separate notion
`TauCeti.SmoothTwoForm.IsNondegenerate.IsLagrangianImmersion`: a smooth immersion with isotropic
tangent images from a manifold of half the dimension; its image may have self-intersections.

Use Tau Ceti's laws. For the isotropic, coisotropic and Lagrangian predicates: independence of the
parametrization (`TauCeti.SmoothTwoForm.IsNondegenerate.isLagrangianMap_comp_diffeomorph_iff`,
`TauCeti.SmoothTwoForm.IsNondegenerate.isIsotropicMap_comp_diffeomorph_iff`,
`TauCeti.SmoothTwoForm.IsNondegenerate.isCoisotropicMap_comp_diffeomorph_iff`), transport by
symplectomorphisms (`TauCeti.SmoothTwoForm.IsNondegenerate.isLagrangianMap_diffeomorph_comp_iff`,
`TauCeti.SmoothTwoForm.IsNondegenerate.isIsotropicMap_diffeomorph_comp_iff`,
`TauCeti.SmoothTwoForm.IsNondegenerate.isCoisotropicMap_diffeomorph_comp_iff`), the dimension counts
(for a map with injective differential at some point, 2 dim N ≤ dim M when it is isotropic and
2 dim N = dim M when it is Lagrangian; dim M ≤ 2 dim N for a coisotropic map from a nonempty source,
with no injectivity hypothesis: `TauCeti.SmoothTwoForm.IsNondegenerate.IsIsotropicMap.two_mul_finrank_le`,
`TauCeti.SmoothTwoForm.IsNondegenerate.IsLagrangianMap.two_mul_finrank`,
`TauCeti.SmoothTwoForm.IsNondegenerate.IsCoisotropicMap.finrank_le_two_mul_finrank`), products of
nonempty sources (`TauCeti.SmoothTwoForm.IsNondegenerate.isLagrangianMap_prodMap_iff` and its
isotropic and coisotropic siblings) and restriction to open sets and open covers
(`TauCeti.SmoothTwoForm.IsNondegenerate.isLagrangianMap_comp_subtype_val_iff`,
`TauCeti.SmoothTwoForm.IsNondegenerate.isLagrangianMap_iff_of_isOpenCover` and their siblings). For
symplectic tangent images: independence of the parametrization and transport
(`TauCeti.SmoothTwoForm.IsNondegenerate.hasSymplecticTangentImages_comp_diffeomorph_iff`,
`TauCeti.SmoothTwoForm.IsNondegenerate.hasSymplecticTangentImages_diffeomorph_comp_iff`); for
Lagrangian embeddings, independence of the parametrization, transport and products
(`Diffeomorph.isLagrangianEmbedding_comp_diffeomorph_iff`,
`Diffeomorph.isLagrangianEmbedding_diffeomorph_comp_iff`,
`TauCeti.SmoothTwoForm.IsNondegenerate.IsLagrangianEmbedding.prodMap`); and for Lagrangian
immersions, products (`TauCeti.SmoothTwoForm.IsNondegenerate.IsLagrangianImmersion.prodMap`).
Nonzero real rescaling of a symplectic form preserves the isotropic, coisotropic and Lagrangian
predicates, Lagrangian immersions and, with the primitive rescaled by the same constant, exact
Lagrangian maps (`TauCeti.SmoothTwoForm.IsNondegenerate.isIsotropicMap_smul_iff`,
`TauCeti.SmoothTwoForm.IsNondegenerate.isCoisotropicMap_smul_iff`,
`TauCeti.SmoothTwoForm.IsNondegenerate.isLagrangianMap_smul_iff`,
`TauCeti.SmoothTwoForm.IsNondegenerate.isLagrangianImmersion_smul_iff`,
`TauCeti.SmoothTwoForm.IsNondegenerate.isExactLagrangianMap_smul_iff`).

For a finite-dimensional real symplectic vector space V and any subspace W, the linear facts are
Tau Ceti's, in `TauCeti.SymplecticForm`: the orthogonal `TauCeti.SymplecticForm.orthogonal` with
`TauCeti.SymplecticForm.mem_orthogonal_iff'`, `TauCeti.SymplecticForm.finrank_orthogonal` and
`TauCeti.SymplecticForm.orthogonal_orthogonal`; `TauCeti.SymplecticForm.isIsotropic_iff`,
`TauCeti.SymplecticForm.IsIsotropic.two_mul_finrank_le`,
`TauCeti.SymplecticForm.IsLagrangian.two_mul_finrank` and
`TauCeti.SymplecticForm.IsIsotropic.isLagrangian_of_finrank`; the identity dim W + dim W^ω = dim V
(`TauCeti.SymplecticForm.finrank_add_finrank_orthogonal`); the coisotropic bound
dim V ≤ 2 dim W (`TauCeti.SymplecticForm.IsCoisotropic.finrank_le_two_mul_finrank`); in any
dimension, W is Lagrangian exactly when it is maximal isotropic,
`Maximal ω.IsIsotropic W` (`TauCeti.SymplecticForm.isLagrangian_iff_maximal_isIsotropic`); and the
equivalence of restricted nondegeneracy, W ∩ W^ω = 0 and, in finite dimension, V = W ⊕ W^ω
(`TauCeti.SymplecticForm.isSymplectic_iff_nondegenerate_restrict`,
`TauCeti.SymplecticForm.isSymplectic_iff_disjoint`, `TauCeti.SymplecticForm.isSymplectic_iff_isCompl`),
from Mathlib's `LinearMap.BilinForm.restrict_nondegenerate_iff_isCompl_orthogonal` and
`LinearMap.BilinForm.isCompl_orthogonal_iff_disjoint` for reflexive forms. For every
`B : LinearMap.BilinForm ℝ V` on a finite-dimensional V, with no reflexivity or nondegeneracy,
dim V ≤ dim W + dim B^⊥(W), and B^⊥(W) ≤ W gives dim V ≤ 2 dim W
(`LinearMap.BilinForm.finrank_le_finrank_add_finrank_orthogonal`,
`LinearMap.BilinForm.finrank_le_two_mul_finrank_of_orthogonal_le`, Tau Ceti). All of these hold in
dimension zero.

Prove the following.

1. *Embeddings.* Define symplectic, isotropic and coisotropic embeddings as smooth embeddings
   (`Manifold.IsSmoothEmbedding`) with symplectic, isotropic, respectively coisotropic tangent
   images. Prove for each of the three: independence of the parametrization (precomposition with a
   diffeomorphism of the source), transport by symplectomorphisms of the target, the dimension
   count of the corresponding tangent-image predicate, products of embeddings from nonempty sources
   for the product form, and restriction to open subsets of the source.
2. *Rescaling of symplectic tangent images.* For c ≠ 0, a map has symplectic tangent images for cσ
   exactly when it has them for σ.
3. *Lagrangian immersions.* A Lagrangian immersion stays one after precomposition with a
   diffeomorphism of its source and after composition with a symplectomorphism of its target; the
   statements are about the immersion and keep its self-intersections, without passing to an
   embedded image.
4. *Tangent-image forms of the linear facts.* For a map f : N → M and a point x where df_x is
   injective, state the facts above for the tangent image W = df_x(T_x N) in (T_(f x) M, σ_(f x)):
   dim N + dim W^σ = dim M, W^σσ = W, and W Lagrangian exactly when W is maximal isotropic. Derive
   them from the linear statements, without restating their definitions or proofs.

*Needs:* Tau Ceti the tangent-image predicates and their laws named above, the linear facts in
`TauCeti.SymplecticForm`; Mathlib `Manifold.IsSmoothEmbedding`.

**Checks.**
- In ℝ⁴ with ω = dq₁ ∧ dp₁ + dq₂ ∧ dp₂, the plane {q₂ = p₂ = 0} is symplectic, the plane
  {p₁ = p₂ = 0} is Lagrangian, a line is isotropic, and every hypersurface is coisotropic. A point
  of ℝ² is isotropic and not coisotropic: the isotropic count 2·0 ≤ 2 holds and the coisotropic
  count 2 ≤ 2·0 fails.
- A figure-eight immersion of the circle into ℝ² is a Lagrangian immersion (every curve in a
  surface is isotropic, of half the dimension) and not a Lagrangian embedding; its image under a
  symplectomorphism is again a Lagrangian immersion with one double point, which a version that
  replaced it by its image would lose.

### Examples

- The zero section, the graphs of closed one-forms and the conormal bundles of submanifolds are
  Lagrangian in T*M; the graph of dθ in T*(ℝ/2πℤ) is Lagrangian and not exact.
- The graph of a symplectomorphism is a Lagrangian correspondence; the diagonal is the graph of the
  identity.
- SO(2) = Sp(2, ℝ) ∩ O(2) is a maximal compact subgroup of SL₂(ℝ) = Sp(2, ℝ), and every A ∈ SL₂(ℝ)
  is joined to its rotation factor by the path P^(1−t) U inside SL₂(ℝ).

### Dependencies

Layer 1. Tau Ceti: the matrix polar package, realification, the symplectic, orthogonal and unitary
subgroups and their intersections, compactness, connectedness and maximality; the structure of
Sp_R and of its Lie algebra; the exact Lagrangian, conormal, graph, Liouville-field, surface, torus
and cosphere results; the tangent-image predicates and the linear symplectic facts. LieGroups
Layers 2 and 9 for §2.1 items 4–6; SmoothBundlesConnections §B1.2, §B1.4 and §B2.1;
UniversalCovers Stages 1–2; DifferentialGeometry Layers 3 and 8; ComplexKahlerGeometry §6.3. Within
the layer, §2.1 needs §2.0; §2.2 and §2.3 need neither.

## Layer 3: correspondences and generating functions

Generating functions should produce actual local canonical transformations, with their domains and
inverse formulas.

### 3.0 Lagrangian correspondences

A correspondence L : M ⇝ N is a Lagrangian embedding into M × N̄ (Convention 8). The transpose and
the product of correspondences are correspondences
(`TauCeti.SmoothTwoForm.IsNondegenerate.IsLagrangianEmbedding.swap_comp`,
`TauCeti.SmoothTwoForm.IsNondegenerate.IsLagrangianEmbedding.prodProdProdComm_comp_prodMap`), and the
diagonal is one (`TauCeti.SmoothTwoForm.IsNondegenerate.isLagrangianEmbedding_diagonal`). In finite
dimension the relational composite of two linear Lagrangian relations is Lagrangian, with or
without excess matching directions (`TauCeti.SymplecticForm.IsLagrangian.relComp`).

Define the composition of correspondences L₁₂ : M₁ ⇝ M₂ and L₂₃ : M₂ ⇝ M₃ as the fibre product
L₁₂ ×_(M₂) L₂₃ with its map to M₁ × M₃. Prove: when L₁₂ × L₂₃ → M₂ × M₂ is transverse to the
diagonal, the fibre product is a smooth manifold of dimension ½(dim M₁ + dim M₃) and its map to
M₁ × M̄₃ is a Lagrangian immersion; when that map is moreover injective and a topological embedding,
the composite is a correspondence M₁ ⇝ M₃. For a clean fibre product, define the excess tangent
kernel, the kernel of the differential of the map to M₁ × M₃, and the reduction by it; assert an
embedded composite only when the quotient by the excess kernel is a smooth manifold and the induced
map is an embedding. Prove associativity of composition whenever all the intermediate fibre
products and quotients satisfy these hypotheses. There is no category of all Lagrangian
correspondences with unrestricted composition. *Needs:* Tau Ceti the transpose, product and diagonal
declarations named above, `TauCeti.SymplecticForm.IsLagrangian.relComp`; Mathlib's transversality
and inverse function theorem on manifolds.

**Checks.**
- The diagonal of (ℝ², dq ∧ dp) is isotropic for ω − ω, its tangent vectors (v, v) and (w, w)
  pairing to ω(v, w) − ω(v, w) = 0, but not for ω + ω, where they pair to 2ω(v, w). The transpose
  of a correspondence for ω_M − ω_N is one for ω_N − ω_M.
- The composite of the graphs of symplectomorphisms φ : M₁ → M₂ and ψ : M₂ → M₃ is transverse and is
  the graph of ψ ∘ φ.
- With M₁ = M₃ a point and M₂ = T*ℝ, the correspondences {p = 0} and {p = 0} have the
  one-dimensional fibre product {p = 0} instead of the expected dimension 1 + 1 − 2 = 0: the excess
  kernel is the whole tangent line and the reduced composite is the point. With {p = 0} and
  {q = 0} the fibre product is transverse, a single point.

### 3.0a Generating functions

For S : Q × Q′ → ℝ smooth on an open W, the graph of dS over W in T*(Q × Q′) is exact Lagrangian
with primitive S, by the tautological property of λ; after reversing the sign of the second fibre
it is the relation p = d_q S, P = −d_Q S. For equal base dimensions, a nondegenerate mixed Hessian
at a point makes both projections of this relation local diffeomorphisms there, by the implicit
function theorem, and hence gives a local symplectomorphism.

On real normed spaces V and W, complete where the inverse function theorem is used, use Tau Ceti's
local theory for a function S on V × W that is C² at a point x₀; all names are in the namespace
`TauCeti`.

- The two projections of the relation, (q, Q) ↦ (q, ∂_q S) and (q, Q) ↦ (Q, −∂_Q S), are
  `TauCeti.cotangentGeneratingSource` and `TauCeti.cotangentGeneratingTarget`. The mixed Hessian
  `TauCeti.cotangentMixedHessian` is invertible exactly when the derivative of the source projection
  is (`TauCeti.isInvertible_fderiv_cotangentGeneratingSource_iff`).
- With invertible mixed Hessian at x₀, the local inverse of the source projection is
  `TauCeti.cotangentGeneratingBranch` and the generated map is `TauCeti.cotangentGeneratedMap`. Near
  the source point its derivative preserves ω
  (`TauCeti.eventually_strongDualCotangentSymplecticForm_fderiv_cotangentGeneratedMap`), it satisfies
  λ − φ*λ = d(S ∘ branch) (`TauCeti.eventually_cotangentLiouvilleForm_sub_cotangentGeneratedMap`), and
  in finite dimension its derivative is invertible
  (`TauCeti.eventually_isInvertible_fderiv_cotangentGeneratedMap`). These are statements about germs
  at the source point: the branch and the generated map carry no meaning away from it.
- The other three kinds, with q, Q positions and p, P covectors: F₂(q, P) = S + ⟨P, Q⟩ gives
  p = ∂_q F₂, Q = ∂_P F₂ (`TauCeti.cotangentPartialLegendre` on `TauCeti.cotangentLegendreChart`, with
  `TauCeti.eventually_fderiv_cotangentPartialLegendre`); F₃(p, Q) = S − ⟨p, q⟩ gives q = −∂_p F₃,
  P = −∂_Q F₃ (`TauCeti.cotangentThirdKindLegendre`, `TauCeti.eventually_fderiv_cotangentThirdKindLegendre`);
  F₄(p, P) = S − ⟨p, q⟩ + ⟨P, Q⟩ gives q = −∂_p F₄, Q = ∂_P F₄ (`TauCeti.cotangentFourthKind`,
  `TauCeti.eventually_fderiv_cotangentFourthKind`). Each kind has its own invertible-Hessian
  hypothesis (`TauCeti.cotangentLegendreHessian`, `TauCeti.cotangentSourceHessian`,
  `TauCeti.cotangentMomentumHessian`).
- Composition: S₁₃ = S₁₂ + S₂₃ evaluated at a solution of ∂_(q₂)(S₁₂ + S₂₃) = 0, an invertible
  q₂-Hessian giving the unique local elimination branch (`TauCeti.exists_cotangentGeneratingComposition`).
- Families S(q, a) with ∂_a S = 0, in finite dimension: when the fibre derivative ∂_a S is
  transverse to zero along the critical set, that set is a manifold of the dimension of V and
  (q, a) ↦ (q, ∂_q S) is a Lagrangian immersion of it
  (`TauCeti.isLagrangianImmersion_cotangentGeneratingSource_comp_coe`); embeddedness is an additional
  hypothesis.
- On a product of manifolds, the intrinsic mixed Hessian of S at (q, Q), the bilinear map
  d_Q(d_q S) on T_Q Q′ × T_q Q, is `TauCeti.mixedHessian`. It is computed in any pair of charts of the
  C² atlases by the linear mixed Hessian of the coordinate expression
  (`TauCeti.mixedHessian_apply_eq_of_mem_maximalAtlas`), its invertibility is chart independent
  (`TauCeti.isInvertible_mixedHessian_iff_of_mem_maximalAtlas`), and exchanging the factors transposes
  it (`TauCeti.mixedHessian_comp_swap_apply`).
- The free particle and the oscillator below
  (`TauCeti.cotangentGeneratedMap_freeParticleGeneratingFunction_eventuallyEq`, on a real Hilbert
  space with p identified with a vector by the Riesz isomorphism;
  `TauCeti.cotangentGeneratedMap_oscillatorGeneratingFunction_eventuallyEq`), and the failure of the
  oscillator's type-one projection exactly at t ∈ πℤ
  (`TauCeti.not_isInvertible_oscillatorPositionProjection_iff`).

The targets are the statements on manifolds. Let Q and Q′ be finite-dimensional and boundaryless,
W ⊆ Q × Q′ open, S smooth on W, and x₀ = (q₀, Q₀) ∈ W with invertible `TauCeti.mixedHessian` at x₀.
Prove `exists_diffeomorph_opens_cotangent_of_isInvertible_mixedHessian`: there are open sets U of
T*Q and V of T*Q′ and a symplectomorphism φ : U → V for the canonical forms, sending
(q₀, d_q S(x₀)) ∈ U to (Q₀, −d_Q S(x₀)), such that every z = (q, p) ∈ U with φ(z) = (Q, P) has
(q, Q) ∈ W, p = d_q S(q, Q) and P = −d_Q S(q, Q) (Cannas da Silva, §4.2, pp. 23–24, in coordinates,
where the nondegenerate mixed Hessian is the local condition). Prove the uniqueness of the branch:
any two such symplectomorphisms through the same point agree on a neighbourhood of
(q₀, d_q S(x₀)). Prove the exact primitive λ_Q − φ*λ_(Q′) = d(S ∘ b) on U, where b(z) = (q, Q) is the
branch, so that φ is an exact symplectomorphism. Prove the manifold forms of the composition and
family statements in the same way, a family being a function S(q, Q, a) on Q × Q′ × A. *Route:*
apply the normed-space statements in cotangent charts, using the chart independence of the mixed
Hessian and the chart transitions of §1.1. *Needs:* §1.1, §1.2; Tau Ceti the normed-space generating
function theory and `TauCeti.mixedHessian` with its chart lemmas; Mathlib `mvfderiv`.

**Checks.**
- S(q, Q) = −‖q − Q‖²/(2t), t ≠ 0, on Euclidean space gives p = ∂_q S = (Q − q)/t and
  P = −∂_Q S = (Q − q)/t, so it generates (q, p) ↦ (q + tp, p), the time-t flow of H = ‖p‖²/2. The
  second-kind function F₂(q, P) = ⟨q, P⟩ + t‖P‖²/2 gives p = P and Q = q + tP, the same map for
  every t, the identity at t = 0, where no first-kind function exists: the graph of the identity
  projects onto the diagonal of the (q, Q)-plane, which is not open.
- The oscillator S_t(q, Q) = (2qQ − (q² + Q²) cos t)/(2 sin t), t ∉ πℤ, gives
  Q = q cos t + p sin t and P = −q sin t + p cos t, the time-t flow of H = (q² + p²)/2; at t = π/2 it
  is S = qQ and the rotation (q, p) ↦ (p, −q). Its type-one projection fails exactly at t ∈ πℤ,
  although the flow stays smooth there.
- For the generated map of S = qQ, λ − φ*λ = p dq − (−q) dp = p dq + q dp = d(qp) = d(S ∘ b), with
  b(q, p) = (q, p); the opposite primitive sign would give d(−qp).

### 3.1 Discrete action, iterates and convex billiards

**Fixed points and finite iterates.** Let S be a smooth generating function on an open W ⊆ Q × Q
whose relation p = d₁S(q, Q), P = −d₂S(q, Q) is the graph of a specified symplectomorphism φ
between open subsets of T*Q. On {q : (q, q) ∈ W} put ψ(q) = S(q, q). Prove
dψ_q = d₁S(q, q) + d₂S(q, q), and the bijection between the critical points of ψ and the fixed points
of φ with base pair in W, sending q to (q, d₁S(q, q)) (Cannas da Silva, Prop. 5.1, p. 29). The
bijection is the case N = 1 of the chain dictionary below.

**Chains of generating functions.** Let S₀, …, S_(N−1), N ≥ 1, be generating functions as above on
open domains Wᵢ ⊆ Q × Q, generating symplectomorphisms φ₀, …, φ_(N−1) between open subsets of T*Q.
Define the cyclic action A(q₀, …, q_(N−1)) = Σᵢ Sᵢ(qᵢ, q_(i+1 mod N)) on the open configuration
domain where every edge (qᵢ, q_(i+1 mod N)) lies in Wᵢ. Its critical equations are the
matching-covector equations −d₂S_(i−1)(q_(i−1), qᵢ) = d₁Sᵢ(qᵢ, qᵢ₊₁) at each vertex, indices mod N:
the outgoing covector of edge i − 1 equals the incoming covector of edge i. Prove
`exists_equiv_periodic_of_generating`: the cyclic sequences of states zᵢ, i ∈ ℤ/N, with zᵢ in the
domain of φᵢ and φᵢ(zᵢ) = zᵢ₊₁, correspond bijectively, by their base points, to the critical points
of A on its configuration domain, the derivative of A being Mathlib's `mvfderiv` for the product
model `ModelWithCorners.pi` on ℤ/N → Q. Such a sequence is the same as a phase point z₀ fixed by the
composite φ_(N−1) ∘ … ∘ φ₀ whose every intermediate state φ_(i−1) ∘ … ∘ φ₀(z₀) lies in the domain of
φᵢ, and the bijection sends a configuration to (q₀, d₁S₀(q₀, q₁)). The hypothesis that the relation
of Sᵢ over Wᵢ is the graph of φᵢ says that every z in the domain of φᵢ has its base pair in Wᵢ and
satisfies the relation, and that every point of Wᵢ is the base pair of some such z. The dictionary
uses neither finite dimension, nor a boundaryless model, nor the symplecticity of the φᵢ.

Iterates are the case of equal summands Sᵢ = S: the critical points of
A_N(q₀, …, q_(N−1)) = Σᵢ S(qᵢ, q_(i+1 mod N)) correspond to the marked phase points fixed by the
N-th iterate of φ with all intermediate iterates defined, and N = 1 recovers ψ. The least period
may be a proper divisor of N; a cyclic shift of a configuration is the same periodic orbit with
another marked point, and the unmarked periodic orbits are the classes of marked ones under cyclic
shifts.

For fixed endpoints q₀ and q_N, use the open-chain action F_N = Σ_(i=0)^(N−1) Sᵢ(qᵢ, qᵢ₊₁). At a
stationary internal configuration with invertible full Hessian in (q₁, …, q_(N−1)), construct by the
implicit function theorem a smooth local critical branch, and evaluate F_N on it to obtain
S_(0…N)(q₀, q_N). Prove the endpoint derivative formulas, the nondegeneracy of the mixed Hessian of
S_(0…N), and that its generating relation is the composite of the relations on the resulting
cotangent domains. Give N = 2 and N = 3 explicitly (Cannas da Silva, Prop. 5.2, p. 30, for the second
iterate under a global uniqueness hypothesis, and the exercise following it for the third). A global
generating function requires the corresponding global uniqueness and graph-projection hypotheses;
local elimination supplies only a local branch. The cyclic correspondence requires neither the
elimination of the internal variables nor the nondegeneracy of the periodic orbit.
*Needs:* §3.0a; Mathlib `mvfderiv`, `ModelWithCorners.pi` and the implicit function theorem.

**Convex planar billiards.** Let χ : ℝ → ℝ² be a smooth L-periodic arclength parametrization,
L > 0, of the boundary of a bounded strictly convex table, positively oriented and injective on
[0, L), strict convexity meaning that every tangent support line meets the boundary only at its
point of tangency. Work on the open strip ℝ × (−1, 1) with the translation τ(s, v) = (s + L, v),
where v is the component along χ′(s) of the unit outgoing velocity; the collision states are the
τ-orbits, and the quotient (ℝ/Lℤ) × (−1, 1) is used only as the topological space
`AddCircle L × (−1, 1)`, with Mathlib's instances, never as a manifold. Construct the
next-collision map β̃ on the strip by the straight chord and specular reflection. Prove its
existence, uniqueness, smoothness, smooth inverse and τ-equivariance β̃ ∘ τ = τ ∘ β̃, so that β̃
descends to a homeomorphism β of the quotient. Tangent collisions v = ±1 are excluded (Cannas da
Silva, §5.2, pp. 30–32, with period 1).

On {(s, t) : s < t < s + L} put S(s, t) = −‖χ(t) − χ(s)‖. Derive v = ∂_s S and w = −∂_t S for the next
state (t, w) (Cannas da Silva, §5.2, pp. 31–32). Prove ∂_s ∂_t S < 0 from strict convexity and the
non-tangency of each chord, so that ∂t/∂v < 0 for the strip map. S is invariant under translating
both arguments by L; its smooth domain excludes the diagonal and its translates. Set λ = v ds and
ω = −dλ = ds ∧ dv on the strip. If ℓ(s, v) is the length of the chord to the next collision, prove
β̃*λ − λ = dℓ, hence β̃*ω = ω. On the quotient take the product of the Haar measure `volume` of
`AddCircle L`, of total mass L by `AddCircle.measure_univ`, with Lebesgue measure on (−1, 1): a
finite Borel measure of full support and total mass 2L. Prove that β is
`MeasureTheory.MeasurePreserving` for it, by the change of variables β̃*ω = ω on the fundamental
domain [0, L) × (−1, 1) and the comparison with the quotient measure. Under the period-one
coordinate u = s/L the canonical covector is p = Lv, so that λ = p du and ω = du ∧ dp; carry this
factor through the area and generating formulas.

Use the cyclic action above, with every Sᵢ = S, to identify critical inscribed N-gons with marked
N-periodic billiard states (Cannas da Silva, §5.2, p. 32); the negative of the cyclic action is the
perimeter. Require consecutive vertices to be distinct, allow non-consecutive repetitions and
periods dividing N, and prove the equal-angle law at every vertex. For each N ≥ 2, maximize the
perimeter, a continuous function on the compact space (`AddCircle L`)^N. Show that a maximizer has
no consecutive coincident vertices: move a repeated vertex off the chord between its neighbours and
use the strict triangle inequality to increase the perimeter. A maximizer therefore lifts into the
smooth configuration domain of the strip, where it is critical for A_N, and gives a periodic
billiard state whose least period divides N. The resulting existence theorem needs no billiard map.
Prove `exists_billiard_periodic_reflection`: for χ : ℝ → `EuclideanSpace ℝ (Fin 2)` smooth,
L-periodic with L > 0, of unit speed, injective on [0, L) and meeting each tangent line
{χ(s) + c χ′(s)} only at χ(s) (orientation plays no role here), and for every N ≥ 2, there are s_k,
k ∈ ℤ/N, with χ(s_(k+1)) ≠ χ(s_k) and ⟨u_(k−1), χ′(s_k)⟩ = ⟨u_k, χ′(s_k)⟩ at every vertex, where u_k
is the unit vector from χ(s_k) to χ(s_(k+1)). *Needs:* the chain dictionary above; Mathlib
`AddCircle`, `AddCircle.measure_univ`, `MeasureTheory.MeasurePreserving`, compactness of
`AddCircle L` and the implicit function theorem.

**Finite-volume recurrence.** Use Mathlib's `MeasureTheory.MeasurePreserving.conservative`,
`MeasureTheory.Conservative.exists_mem_iterate_mem`,
`MeasureTheory.Conservative.ae_mem_imp_frequently_image_mem` and
`MeasureTheory.Conservative.ae_frequently_mem_of_mem_nhds`. For a measurable self-map of a
topological space with its Borel σ-algebra, preserving a specified finite measure of full support,
prove the neighbourhood return formulation: every nonempty open U contains a point returning to U
after a positive number of iterates (Cannas da Silva, Thm. 5.3, p. 32, stated there for
area-preserving diffeomorphisms of surfaces of finite area; the measure-theoretic statement needs no
symplectic structure). On a second-countable space with its Borel σ-algebra, keep Mathlib's
almost-everywhere conclusion of infinitely many returns to every neighbourhood of the starting
point. Apply both statements to the billiard map β and the finite invariant measure above.
Symplectomorphisms of higher-dimensional phase spaces preserving a finite smooth measure are
instances of the same two statements. *Needs:* the billiard measure above; Mathlib
`MeasureTheory.Conservative`, `IsOpen.measure_ne_zero`.

**Checks.**
- For S = qQ on ℝ × ℝ, which generates the rotation φ(q, p) = (p, −q) of all of T*ℝ, ψ(q) = q² has
  the single critical point 0, matching the single fixed point (0, 0). For N = 2,
  A₂ = 2q₀q₁ has the single critical point (0, 0), and φ² = −id fixes only the origin. For N = 4,
  A₄ = (q₀ + q₂)(q₁ + q₃) is critical exactly on the plane {q₂ = −q₀, q₃ = −q₁}, matching
  φ⁴ = id, all of whose points are fixed, through (q₀, q₁) ↦ (q₀, d₁S(q₀, q₁)) = (q₀, q₁): the
  dictionary holds on a degenerate critical set.
- For the circle of radius R and L = 2πR, S(s, t) = −2R sin((t − s)/(2R)), so
  v = ∂_s S = cos((t − s)/(2R)) and β(s, v) = (s + 2R arccos v mod L, v); the twist is
  ∂_s ∂_t S = −sin((t − s)/(2R))/(2R) < 0 on 0 < t − s < L, and with ℓ = 2R √(1 − v²),
  β̃*λ − λ = −2Rv (1 − v²)^(−1/2) dv = dℓ. The state (s, v) is periodic exactly when its rotation
  number (arccos v)/π is rational.
- On that circle, for N = 4 the perimeter maximizer is the doubled diameter, with perimeter 8R and
  least period 2, not the inscribed square, with perimeter 4√2 R. For N = 3 it is the equilateral
  triangle, where both sides of the equal-angle law equal 1/2 at every vertex; the inscribed triangle
  with vertices at the angles 0, π/2 and π fails the law at the vertex at angle 0, where the two
  sides are 0 and 1/√2. For N = 2 the law says that the chord is orthogonal to both tangents, a
  double normal.
- Translation x ↦ x + 1 of ℝ preserves Lebesgue measure, which has full support and infinite mass,
  and no point of (0, 1/2) returns to it: finiteness of the measure is needed.

### Examples

- The free particle, its second-kind generating function and the oscillator of §3.0a; the
  composite of the free flows for times s and t is generated by the elimination
  −‖q₁ − q₂‖²/(2s) − ‖q₂ − q₃‖²/(2t), critical at q₂ = (t q₁ + s q₃)/(s + t), which gives
  −‖q₁ − q₃‖²/(2(s + t)) when s + t ≠ 0.
- Billiards in the disc, with β(s, v) = (s + 2R arccos v, v), and the inscribed polygons of maximal
  perimeter.

### Dependencies

Layers 1 and 2 (the canonical forms, Lagrangian embeddings and correspondences). Tau Ceti: the
correspondence constructions, the linear relational composition, the normed-space generating
function theory and the intrinsic mixed Hessian. Mathlib: `mvfderiv`, `ModelWithCorners.pi`, the
implicit function theorem, `AddCircle` with its measure and compactness, and finite-measure
recurrence. Within the layer, §3.1 needs §3.0a; §3.0 is independent of both. Nothing here depends on
the other roadmaps of the family.

<a id="c4-relative-symplectic-germs"></a>

## Layer 4: relative symplectic germs

Neighbourhood theorems identify precisely which data determine a symplectic germ along a
submanifold. Here a symplectomorphism of neighbourhoods is a diffeomorphism between open subsets
whose pullback of one restricted form is the other (Convention 3). Ordinary Darboux and Moser on a
compact manifold with a given smooth symplectic path are HeegaardFloer §4.1 (F2.1); every global
comparison theorem states its symplectic-path hypothesis explicitly, since equality of the endpoint
cohomology classes alone does not provide such a path.

### 4.1 The relative Poincaré lemma

Build the relative Poincaré lemma from fibre scaling in a tubular neighbourhood (Tau Ceti's
`TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_subset`, with the fibrewise retraction of
GeometricTopology §1.5) and the homotopy operator on M × [0, 1], Tau Ceti's
`TauCeti.homotopyOperator` with its identity
`TauCeti.mextDeriv_homotopyOperator_add_homotopyOperator_mextDeriv` and its regularity
`TauCeti.IsSmoothForm.homotopyOperator` (DifferentialGeometry §5.4 adds its naturality under
pullback). On a fibrewise star-shaped tube, or an adapted coordinate
box, let i : Q → M be the zero-section inclusion and r the retraction. For a closed form η of
positive degree, construct β with dβ = η − r*(i*η) and with β zero as a full ambient tensor along Q
(Cannas da Silva, Prop. 6.8, p. 39, for i*η = 0; the tube is Thm. 6.5, p. 37). In particular i*η = 0
gives dβ = η, even when η does not vanish as a full ambient tensor along Q; full ambient vanishing
of η is a stronger hypothesis that also gives the primitive with zero first jet of §4.3. The
coordinate-box case is Tau Ceti's, on an open convex subset of a product E × N of normed spaces
that is stable under scaling the normal coordinate by t ∈ [0, 1]: the fibre-scaling operator
`TauCeti.fiberwisePoincareHomotopy` vanishes as a full ambient tensor at every point (q, 0)
(`TauCeti.fiberwisePoincareHomotopy_zeroSection`), its differential is η − r*η for a closed C¹
form η (`Convex.extDeriv_fiberwisePoincareHomotopy`), and it gives a C^r primitive of a closed C^r
form η, 1 ≤ r ≤ ∞, with i*η = 0 (`Convex.exists_contDiffOn_relative_primitive`); the target is
their transport to a tube on a manifold. Build the relative, parameter-preserving version for
smooth families of closed forms by tubular fibre scaling
and the homotopy operator, the primitives vanishing along the fixed submanifold, consuming the local
smooth-parameter primitive selection and the time-dependent pullback differentiation identity of
HeegaardFloer §4.1. Consume the domain-local Moser lemma of HeegaardFloer §4.1 and prove its
refinement fixing the submanifold, from these relative primitives. *Needs:* Tau Ceti
`TauCeti.homotopyOperator`, `TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_subset`,
`Convex.exists_contDiffOn_relative_primitive`; DifferentialGeometry §5.4; GeometricTopology §1.5;
HeegaardFloer §4.1.

**Checks.**
- On M = ℝ² with Q the x-axis, r(x, y) = (x, 0) and η = dx ∧ dy (so i*η = 0), fibre scaling
  (x, y) ↦ (x, ty) gives β = −y dx: dβ = dx ∧ dy and β vanishes along y = 0. The primitive x dy also
  has differential dx ∧ dy but does not vanish along Q.

### 4.2 The relative Moser theorem

Prove `exists_diffeomorph_opens_of_eq_along`: if two symplectic forms on the same M agree as
bilinear forms on the whole tangent space T_(i q) M at every point of a compact embedded
i : Q → M, there are open neighbourhoods U₀ and U₁ of i(Q) and a diffeomorphism U₀ → U₁ fixing i(Q)
pointwise which pulls the second form back to the first (Cannas da Silva, Thm. 7.4, p. 45). *Route:*
the relative Poincaré primitive of the difference vanishes on Q; the affine interpolation is
symplectic on a uniform neighbourhood of Q, and the time-dependent flow of the Moser field stays
there after shrinking. *Needs:* §4.1; HeegaardFloer §4.1 (time-dependent flows and the Moser lemma);
GeometricTopology §1.5.

**Checks.**
- On ℝ² with Q the x-axis, ω₀ = dx ∧ dy and ω₁ = (1 + y²) dx ∧ dy agree along Q. The map
  φ(x, y) = (x, g(y)), with g the inverse of u ↦ u + u³/3, satisfies (1 + g²) g′ = 1, hence
  φ*ω₁ = ω₀; it fixes Q and dφ = id along Q.

### 4.3 Relative Moser with prescribed first jet

Under full ambient equality of the two forms along compact Q, strengthen §4.2 to an ambient
first-jet identity: the diffeomorphism of neighbourhoods fixes Q and its differential is the
identity on TM|Q. Prove that tubular fibre scaling applied to η = ω₁ − ω₀ gives a primitive β whose
value and first jet vanish along Q: the contraction contributes one normal factor and the tensor η
another. Formulate this as β having zero first jet, equivalently β and its covariant derivative
vanishing along Q for any auxiliary smooth connection. The affine path is symplectic on a common
shrunk neighbourhood; ι_(Y_t) ω_t = −β then gives a field Y_t with zero first jet along Q, and the
variational equation of its flow gives the ambient differential identity. This strengthening needs
full ambient tensor equality, not merely equality of the pulled-back forms on TQ. *Needs:* §4.1,
§4.2.

**Checks.**
- On ℝ² with Q the x-axis, ω₁ = 2 dx ∧ dy and ω₀ = dx ∧ dy have equal (zero) pullbacks to Q but
  differ on T_(x,0) ℝ². The map (x, y) ↦ (x, y/2) pulls ω₁ back to ω₀ and fixes Q, as §4.4
  provides, but every map with φ*ω₁ = ω₀ has det dφ = 1/2, so none has dφ = id along Q.

### 4.4 The point-germ relative Darboux theorem

For an embedded submanifold i : Q → M, not necessarily compact, and q₀ ∈ Q, prove
`exists_diffeomorph_opens_of_mpullback_eq`: two symplectic forms on M with equal pullbacks to Q are
related by a diffeomorphism between open neighbourhoods of i(q₀) that fixes the points of i(Q) near
q₀ (for Q a point this is Darboux's theorem, Cannas da Silva, Thm. 8.1, p. 46, proved from
Thm. 7.4). The restricted two-form may have varying rank. *Route:* first extend the identity of
T_(q₀)Q to an ambient linear symplectomorphism (T_(i q₀) M, ω₀) → (T_(i q₀) M, ω₁) by Tau Ceti's
symplectic Witt extension `TauCeti.SymplecticForm.exists_isSymplectomorphism_extend_linearEquiv`: for
finite-dimensional symplectic vector spaces of equal dimension, a linear isomorphism between
arbitrary subspaces, degenerate ones included, which carries one restricted form to the other
extends to a linear symplectomorphism agreeing with it on the subspace; two forms on one space, a
subspace and its identity are the case used here. Realize this extension by a local diffeomorphism
fixing Q in adapted submanifold coordinates. The adjusted forms agree on the whole ambient tangent
space at i(q₀), so their affine path is symplectic on a common neighbourhood for all t ∈ [0, 1].
Apply the relative radial homotopy of §4.1 to their difference: the resulting one-form vanishes as
a full covector along Q, its Moser field vanishes on Q, and the stationary trajectory at i(q₀)
gives a flow for the full parameter interval on a smaller neighbourhood. This local theorem uses no
global normal-bundle identification along Q. *Needs:* §4.1; Tau Ceti
`TauCeti.SymplecticForm.exists_isSymplectomorphism_extend_linearEquiv`; HeegaardFloer §4.1
(time-dependent flows).

**Checks.**
- Both hypotheses of the Witt extension are needed: without equal dimension no linear isomorphism
  exists, and the dilation by 2 of a symplectic plane preserves no nonzero bilinear form, since
  B(2v, 2w) = 4B(v, w).
- For Q the x-axis in ℝ² and ω₁ = 2 dx ∧ dy, the map (x, y) ↦ (x, y/2) of §4.3's Check is such a
  germ; the theorem asks nothing of the forms off TQ.

### 4.5 Neighbourhood germs with prescribed ambient derivative

Let i : Q → (M, ω_M) and j : Q′ → (N, ω_N) be smooth embeddings, Q compact, and f : Q → Q′ a
diffeomorphism; M, N, Q and Q′ are finite-dimensional and boundaryless, M and N Hausdorff and second
countable. Let A be a family of linear isomorphisms A_q : T_(i q) M → T_(j(f q)) N with
A_q*ω_N = ω_M and A_q ∘ di_q = dj_(f q) ∘ df_q, smooth in the sense that its expression in tangent
coordinates, Mathlib's `inTangentCoordinates` (the form in which Mathlib states the smoothness of
`mfderiv`), is smooth. Prove `exists_diffeomorph_opens_mfderiv_eq`: there are open neighbourhoods U of
i(Q) and V of j(Q′) and a symplectomorphism Φ : U → V with Φ ∘ i = j ∘ f and dΦ_(i q) = A_q (Cannas da
Silva, Thm. 8.4, p. 48, gives the Lagrangian case without the derivative prescription, for two forms
on one manifold). Conversely, the differential of any such symplectomorphism along Q gives these
bundle data. No constant-rank hypothesis on the pulled-back two-form is needed when A is supplied.

*Route.* Construct the extension of the prescribed derivative before applying Moser. Choose tubular
splittings TM|Q = TQ ⊕ ν_M and TN|Q′ = TQ′ ⊕ ν_N, and write A_q(v, n) = (df_q(v) + B_q(n), C_q(n)); C is
an isomorphism of normal bundles over f. On the source normal bundle set q′ = exp_(f q)(B_q(n)) for
an auxiliary metric on Q′, and transport C_q(n) in ν_N along t ↦ exp_(f q)(t B_q(n)); compose this map
into ν_N with the target tubular map. Its derivative along the zero section is A, and the inverse
function theorem, embeddedness and compactness give a diffeomorphism of neighbourhoods extending f,
whose pulled-back form agrees with ω_M on the whole ambient tangent space along Q. The relative
Moser theorem with prescribed first jet (§4.3) then preserves the derivative A.

Define neighbourhood germs along the whole submanifold, by agreement after shrinking (Convention 3).
Prove the restriction, identity, inverse and composition laws, the prescribed derivatives composing
as bundle maps. Prove that two extensions obtained from the same (f, A), including those built from
different tubular maps, metrics or connections, differ by a symplectic germ fixing Q pointwise with
full ambient derivative the identity. The point-germ theorem §4.4 needs an extension at one point
only; this compact-submanifold theorem needs the specified smooth bundle isomorphism along all of
Q. *Needs:* §4.3; GeometricTopology §1.5; Mathlib `inTangentCoordinates` and the inverse function
theorem on manifolds; SmoothBundlesConnections Layers 3 and 5 (an induced connection and its
parallel transport in ν_N).

**Checks.**
- For Q = Q′ a point, A is a linear symplectomorphism T_p M → T_(p′) N and the theorem is Darboux's
  theorem with prescribed differential at the point.
- For M = N = T² × ℝ² with the product of the area forms, Q = Q′ = T² × {0}, i = j and f = id, the
  data A = id and A = id ⊕ (−id) (on T(T²) ⊕ T(ℝ²), symplectic since the factors are ω-orthogonal)
  are realized by the identity and by (x, y) ↦ (x, −y): both fix Q pointwise, and the germ depends
  on A, not on f alone.

### 4.6 The symplectic neighbourhood theorem

For a compact symplectic submanifold i : Q → M (an embedding with symplectic tangent images),
construct its symplectic normal bundle TQ^ω, the bundle of ω-orthogonals of the tangent images, as
a smooth subbundle of i*TM with its fibre form. Prove the symplectic neighbourhood theorem: a
symplectic isomorphism of symplectic normal bundles over a symplectomorphism of the submanifolds
extends to a symplectomorphism of neighbourhood germs. Construct a smooth compatible complex
structure and complement along the submanifold, and a symplectic connection, from
SmoothBundlesConnections Layers 2–4, by preserving the fibre form; build the model closed form,
nondegenerate on a neighbourhood of the zero section of TQ^ω, and show that its germ is independent
of the connection. *Route:* construct the ambient bundle isomorphism of §4.5 from the normal data.
*Needs:* §2.3, §4.5; SmoothBundlesConnections Layers 2–4.

**Checks.**
- For Q = ℝ² × {0} in ℝ⁴ with ω = dq₁ ∧ dp₁ + dq₂ ∧ dp₂, TQ^ω = {0} × ℝ², and the model is ℝ⁴ itself.
  For Q a point, TQ^ω = T_p M and the theorem is Darboux's theorem.

### 4.7 Weinstein's Lagrangian neighbourhood theorem

For a compact Lagrangian embedding i : Q → M, identify the normal quotient TM|Q / TQ with T*Q by
[n] ↦ ω(·, n)|TQ (Cannas da Silva, Thm. 9.1, p. 51), and prove
`exists_diffeomorph_opens_cotangent_of_isLagrangianEmbedding`: a neighbourhood of i(Q) is
symplectomorphic to a neighbourhood of the zero section of T*Q with the canonical form, each point
i(q) going to the zero covector at q (Cannas da Silva, Thm. 9.3, p. 51, building on Thm. 8.4, p. 48,
which it attributes to Weinstein). Agreement of the pullbacks on TQ and agreement on the ambient
tangent bundle are distinct: the linear extension and its tubular realization of §4.5 connect them.
*Route:* construct the ambient bundle isomorphism of §4.5 from the identification of the normal
bundle with T*Q. *Needs:* §1.2, §2.2 (the zero section of T*Q), §4.5; Tau Ceti
`TauCeti.SmoothTwoForm.IsNondegenerate.IsLagrangianEmbedding`.

**Checks.**
- For the unit circle in (ℝ², dx ∧ dy), a Lagrangian curve, the map from the punctured plane to
  T*(ℝ/2πℤ) given in polar coordinates by (r, θ) ↦ (θ, p = (1 − r²)/2) satisfies
  dθ ∧ dp = r dr ∧ dθ = dx ∧ dy and sends each point of the circle to its zero covector. The map
  p = 1 − r agrees with it along the circle, where r = 1, but pulls dθ ∧ dp back to (1/r) dx ∧ dy, so
  it is not a symplectomorphism off the circle.
- For the zero section of T*Q itself the identity is such a neighbourhood map.

### 4.8 Coisotropic embeddings

For an abstract compact presymplectic manifold Q with a closed two-form σ of constant rank, build
its kernel distribution, prove its involutivity from the closedness of σ, and construct its
characteristic foliation by DifferentialGeometry Layer 4. Construct the coisotropic embedding model
near the zero section of the dual (ker σ)* of the kernel bundle and prove nondegeneracy there. Prove
`exists_diffeomorph_opens_of_isCoisotropicMap`: for a compact Q and smooth embeddings i : Q → M and
j : Q → N with coisotropic tangent images and i*ω_M = j*ω_N, there are open neighbourhoods of i(Q) and j(Q) and a
symplectomorphism between them sending i(q) to j(q) (Cannas da Silva, Thm. 8.6, p. 49, for two forms
on one ambient manifold, stated there without compactness and without proof; Gotay, Local
Uniqueness Theorem, p. 111, proved in §III, p. 113, for closed embeddings). For an embedded
coisotropic submanifold the rank of the kernel of the pulled-back form equals the codimension
automatically. Compactness is used only for uniform neighbourhoods, not for the fibrewise linear
statements. Develop the kernel, leaf and quotient tangent API. *Needs:* §2.3, §4.3 or
§4.5; DifferentialGeometry Layer 4; GeometricTopology §1.5; SmoothBundlesConnections §B2.1 (dual
bundles).

**Checks.**
- For the round sphere S³ ⊂ ℂ² = ℝ⁴, the kernel of the restricted form at z is the line spanned by
  iz, the Hopf direction: rank one, the codimension.
- For σ = 0 the kernel is all of TQ, (ker σ)* = T*Q, and the model is the cotangent bundle with its
  canonical form, as in §4.7.

### Examples

- The circle in the plane, with its annular neighbourhood identified with a neighbourhood of the
  zero section of T*S¹ by p = (1 − r²)/2; the round sphere S³ ⊂ ℝ⁴ with its Hopf characteristic
  foliation as a coisotropic submanifold.
- The forms (1 + y²) dx ∧ dy and dx ∧ dy on ℝ², related near the x-axis by a diffeomorphism fixing it
  with identity differential; the forms 2 dx ∧ dy and dx ∧ dy, related by one fixing it with
  differential diag(1, 1/2).

### Dependencies

Layers 1–3, in particular §2.2 and §2.3. HeegaardFloer §4.1 (Darboux, the domain-local Moser lemma,
smooth-parameter primitives, time-dependent pullback and flows); DifferentialGeometry Layer 4 and
§5.4; GeometricTopology §1.5; SmoothBundlesConnections Layers 2–5; Tau Ceti
`TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_subset`,
`TauCeti.SymplecticForm.exists_isSymplectomorphism_extend_linearEquiv`; Mathlib
`inTangentCoordinates`. Within the layer: §4.2 needs §4.1; §4.3 needs §4.2; §4.4 needs §4.1;
§4.5 needs §4.3; §4.6 and §4.7 need §4.5; §4.8 needs §4.3 or §4.5.

## Downstream consumers

- HamiltonianReduction R1 uses the canonical form and the cotangent lift of Layer 1 for its
  cotangent momentum theorem. Its form argument is `canonicalForm`, written σ there: Tau Ceti's
  `TauCeti.CotangentBundle.symplecticForm I M` on `Cotangent I M`, that is
  `TauCeti.CotangentBundle I M`, with model `cotangentModel I`. It is symplectic
  (`TauCeti.CotangentBundle.isSymplectic_symplecticForm`), and its chart identity is
  `TauCeti.CotangentBundle.inChartAt_symplecticForm_apply`: for every cotangent chart centre z₀,
  every w in that chart's target and every pair of model tangent vectors u, v, its coordinate value
  is `TauCeti.strongDualCotangentSymplecticForm u v`; the chart-target condition excludes the values
  of the total chart inverse outside its domain. At each chart centre
  `TauCeti.RoughForm.inChartAt_extChartAt_self` identifies this value with the intrinsic form, so the
  chart identity determines σ; neither fact needs a finite-dimensional base. For a jointly smooth
  left action, R1 uses σ to assert ι_(ξ_(T*M)) σ = dH_ξ, where H_ξ(q, p) = p(ξ_M(q)) and ξ_(T*M) is the
  fundamental field of the inverse-derivative cotangent lift (Cannas da Silva, §18.1, exercise on
  p. 106); the group-action momentum theorem is R1's. For the trivial action both the fundamental
  field and H are zero, and on a zero-dimensional base the cotangent model is zero and the form is
  zero, nondegenerate on that zero space. The Checks of §1.2 test this convention.
- HamiltonianReduction R3 applies the tubular fibre-homotopy construction of §4.1–§4.3 to its
  orbit slices.
- IntegrableSystems I5.2, the finite action and periodic-orbit dictionary, instantiates the
  chain dictionary of §3.1, after its sign change and deck quotient, with its cyclic configurations.
- MathematicalBilliards builds on the convex billiards of §3.1 and on
  `exists_billiard_periodic_reflection`.
- LieGroups Layers 7 and 9 use the ambient polar coordinates of §2.0, and Layer 9 uses the matrix
  intersections, polar preservation and maximality of §2.1 for its matrix applications.
- HeegaardFloer §4.6h (F2.6h) uses the ±I-equivariance of the polar deformation before descent to
  PSL(2, ℂ); HeegaardFloer §5.1 (F3) uses the cotangent forms, exact Lagrangians and graph and
  zero-section examples of Layers 1 and 2.
- ContactGeometry CG4 and CG5 use the cosphere results of §2.2, with its two explicitly signed forms
  and the metric-radial comparison.
- FukayaTheory uses Layers 1, 2 and 4; TaubesGromov uses Layer 4; LieGroupoidsPoisson uses Layer 1.

## Scope and ownership

**This roadmap owns** the targets stated above: the open-restriction forms of fibre translation and
dilation (§1.4); the smooth ambient polar coordinates (§2.0); the reindexing, topology comparison,
connectedness of C_R, Lie subgroup identifications, the adjoint model of Sp_R and the matrix-model
specializations (§2.1); the two-point intersection theorem, the conormal bundle, canonical relations
with diffeomorphic projections, the local Liouville flow rescaling and the Kodaira–Thurston manifold
(§2.2); symplectic, isotropic and coisotropic embeddings, rescaling of symplectic tangent images,
transport of Lagrangian immersions and the tangent-image forms of the linear facts (§2.3); the
composition of Lagrangian correspondences (§3.0); generating functions on manifolds, with branch
uniqueness, exact primitive, composition and families (§3.0a); the discrete action, iterates, open
chains, convex billiards and recurrence (§3.1); and the relative Poincaré lemma on tubes and in
families and the relative Moser, Darboux, prescribed-derivative, symplectic, Lagrangian and
coisotropic neighbourhood theorems (§4.1–§4.8).

**In the library at the pins and used by name above.** Tau Ceti has the cotangent bundle, its
charts, the Liouville and canonical forms with their chart formulas, cotangent lifts and the
cotangent relation (§1.1–§1.3); the open-restriction, product, translation and dilation identities
(§1.4); the elementary matrix polar package (§2.0); realification, the closedness and the pairwise
intersections of Sp_R, O_R and C_R, compactness of U(n), the symplecticity of the polar factors of a
symplectic matrix, connectedness of U(n), GL(n, ℂ) and Sp(2n, ℝ), maximal compactness of U(n) in
GL(n, ℂ) and in Sp(2n, ℝ), the centre and the Cartan involution of Sp_R, the smoothness of the
Cartan involution and its differential −Xᵀ, the trivial radical, Killing form and Cartan positivity
of the symplectic Lie algebra, the reindexing to `Fin (n+n)` and the closed-subgroup theorem with
its unitary case (§2.1); exact Lagrangian maps, the zero section, Lagrangian and exact graphs,
conormal sets and conormal maps with their examples, Lagrangian graphs of symplectomorphisms, the
Euler field as Liouville field with its flow, the global Liouville flow rescaling, commutation of
primitive-preserving symplectomorphisms with the Liouville flow, the classification of
λ-preserving diffeomorphisms, area forms on surfaces, the cotangent torus graphs and the cosphere
contact forms with their Reeb flow and radial comparison (§2.2); the tangent-image predicates,
Lagrangian embeddings and immersions with their invariance, dimension, product, restriction and
rescaling laws, and the linear symplectic facts (§2.3); the transpose, product and diagonal of
correspondences and the linear relational composition (§3.0); the normed-space generating function
theory, the intrinsic mixed Hessian and the free-particle and oscillator examples (§3.0a); and the
tubular neighbourhood theorem, the relative Poincaré lemma on an adapted coordinate box and the
symplectic Witt extension (Layer 4). Mathlib has finite-measure recurrence (§3.1). The exact
declarations are in the supplier contracts. The instances and lemmas needed to connect these
interfaces with each other and with the owners below are explicit work, of this roadmap or of the
owner, and never assumptions.

**Owned elsewhere.**

- Ordinary Darboux and Moser on a compact manifold with a given smooth symplectic path, the
  domain-local Moser lemma, smooth-parameter primitive selection and the time-dependent pullback
  identity: HeegaardFloer §4.1 (F2.1). This roadmap owns only the refinements relative to a
  submanifold.
- The generic calculus of forms, flows, the homotopy operator and its naturality, Frobenius and
  leaves, and the de Rham theorem: DifferentialGeometry (Layers 3, 4 and 8, §5.4), on Tau Ceti's
  homotopy operator.
- Generic tubular neighbourhoods, their uniqueness and their fibrewise retraction: GeometricTopology
  §1.5, on Tau Ceti's tubular neighbourhood theorem.
- Pullbacks, dual bundles and smooth bundle operations, free proper quotients, associated bundles,
  connections, curvature and parallel transport: SmoothBundlesConnections (§B1.2, §B1.4,
  Layers 2–5).
- The closed-subgroup theorem, the general compact-complexification theorem and the generic
  Cartan, adjoint-model and matrix-model theorems: LieGroups Layers 2, 7 and 9. Their applications
  to C_R and Sp_R are §2.1 here.
- The parity of odd Betti numbers of compact Kähler manifolds: ComplexKahlerGeometry §6.3 (K6.1).
- Universal covers, deck groups and the Galois correspondence: UniversalCovers Stages 1–2.
- The contact predicate, the Levi form and contact-specific Darboux, Gray and neighbourhood
  refinements: ContactGeometry CG1 and CG3–CG5; ContactGeometry CG4 and CG5 consume the cosphere
  application of §2.2, whose metric-radial comparison belongs to §2.2.
- Floer theory, quantum invariants and contact topology stay with their owners, among them
  HeegaardFloer and ContactGeometry; the Liouville measure of a higher-dimensional phase space is
  not a target of this roadmap.

**Former numbering.** Citations of the former section ids resolve as follows: C1 is now Layer 1,
its item n being §1.n; C2 is now Layer 2, its opening paragraphs being §2.3; C2.0, C2.1 and C2.2
are now §2.0, §2.1 and §2.2; C3 is now Layer 3, its opening paragraphs being §3.0 and §3.0a; C3.1
is now §3.1; and C4 is now Layer 4, §4.1–§4.8 in the same order.

## Exact supplier contracts

### From Mathlib

- Manifolds and bundles: `ModelWithCorners`, `ModelWithCorners.pi`, `IsManifold`, `TangentSpace`,
  `mfderiv`, `mvfderiv` (the differential of a real-valued function), `Diffeomorph`,
  `TopologicalSpace.Opens`, `Bundle.TotalSpace`, `Bundle.contMDiff_zeroSection`,
  `Manifold.IsSmoothEmbedding`, `inTangentCoordinates` (the expression of a family of maps between
  tangent spaces in tangent coordinates, in which `mfderiv` is smooth), and the inverse function
  theorem on manifolds.
- Matrices and groups: `Matrix.J`, `Matrix.fromBlocks`, `Matrix.reindex`, `finSumFinEquiv`,
  `finCongr`; `Matrix.symplecticGroup` with `SymplecticGroup.mem_iff`, `SymplecticGroup.mem_iff'`,
  `SymplecticGroup.transpose_mem_iff`, `SymplecticGroup.inv_eq_symplectic_inv`,
  `SymplecticGroup.coe_inv'`; `Matrix.orthogonalGroup` with `Matrix.mem_orthogonalGroup_iff` and
  `Matrix.mem_orthogonalGroup_iff'`; `Matrix.unitaryGroup` with `Matrix.UnitaryGroup.inv_val`;
  `Unitary.toUnits`; `Units.val`; `Maximal`; `cfc` and `Real.log`; `LieAlgebra.Symplectic.sp`.
- Linear algebra: `LinearMap.BilinForm`, `LinearMap.BilinForm.restrict_nondegenerate_iff_isCompl_orthogonal`,
  `LinearMap.BilinForm.isCompl_orthogonal_iff_disjoint` (for reflexive forms).
- Measure and dynamics: `AddCircle` with its Haar measure `volume` and `AddCircle.measure_univ`
  (total mass L), `MeasureTheory.MeasurePreserving`, `MeasureTheory.MeasurePreserving.conservative`
  (for a finite measure), `MeasureTheory.Conservative.exists_mem_iterate_mem` (a set of positive
  measure contains a point returning to it), `MeasureTheory.Conservative.ae_mem_imp_frequently_image_mem`,
  `MeasureTheory.Conservative.ae_frequently_mem_of_mem_nhds` (on a second-countable space with
  opens measurable), `IsOpen.measure_ne_zero` (for a measure positive on open sets),
  `EuclideanSpace ℝ (Fin 2)`.

### From Tau Ceti

All the declarations below are proved at the pin; each is assumed with the hypotheses of its
statement there.

- *Cotangent bundle (§1.1–§1.4).* `TauCeti.CotangentBundle`, `Bundle.isSubmersion_proj`,
  `TauCeti.CotangentBundle.extChartAt_extChartAt_symm`; `TauCeti.CotangentBundle.liouvilleForm`,
  `TauCeti.CotangentBundle.inChartAt_liouvilleForm`, `TauCeti.CotangentBundle.mpullback_liouvilleForm`,
  `TauCeti.CotangentBundle.mpullback_liouvilleForm_section`, `TauCeti.CotangentBundle.symplecticForm`,
  `TauCeti.CotangentBundle.symplecticForm_eq_neg_mextDeriv`,
  `TauCeti.CotangentBundle.isSymplectic_symplecticForm`, `TauCeti.strongDualCotangentSymplecticForm`,
  `TauCeti.CotangentBundle.inChartAt_symplecticForm_apply`, `TauCeti.RoughForm.inChartAt_extChartAt_self`
  (none of these needs a finite-dimensional or boundaryless base); `Diffeomorph.cotangent`,
  `Diffeomorph.cotangent_refl`, `Diffeomorph.cotangent_trans`, `Diffeomorph.cotangent_symm`,
  `Diffeomorph.mpullback_cotangent_liouvilleForm`, `Diffeomorph.mpullback_cotangent_symplecticForm`;
  `TauCeti.CotangentBundle.instMulAction`, `TauCeti.CotangentBundle.instContMDiffConstSMul`,
  `TauCeti.CotangentBundle.instContMDiffSMul`, `TauCeti.CotangentBundle.mpullback_smul_liouvilleForm`,
  `TauCeti.CotangentBundle.mpullback_smul_symplecticForm`; `TauCeti.CotangentBundle.cotangentRel`,
  `TauCeti.CotangentBundle.cotangentRel_id_iff`, `TauCeti.CotangentBundle.cotangentRel_comp_iff` (f
  differentiable at x and g at f(x)), `TauCeti.CotangentBundle.cotangentRel_diffeomorph_iff`,
  `TauCeti.CotangentBundle.cotangentRel_const_iff`; `TauCeti.CotangentBundle.restrictOpen`,
  `TauCeti.CotangentBundle.mpullback_restrictOpen_liouvilleForm`,
  `TauCeti.CotangentBundle.mpullback_restrictOpen_symplecticForm`,
  `TauCeti.CotangentBundle.prodDiffeomorph`,
  `TauCeti.CotangentBundle.mpullback_prodDiffeomorph_liouvilleForm`,
  `TauCeti.CotangentBundle.mpullback_prodDiffeomorph_symplecticForm`,
  `TauCeti.CotangentBundle.mpullback_vectorBundleTranslateDiffeomorph_liouvilleForm`,
  `TauCeti.CotangentBundle.mpullback_vectorBundleTranslateDiffeomorph_symplecticForm`,
  `TauCeti.CotangentBundle.mpullback_vectorBundleTranslateDiffeomorph_symplecticForm_eq_self_iff`,
  `TauCeti.CotangentBundle.mpullback_vectorBundleScalarDiffeomorph_liouvilleForm`,
  `TauCeti.CotangentBundle.mpullback_vectorBundleScalarDiffeomorph_symplecticForm` (c ≠ 0).
- *Forms.* `TauCeti.SmoothTwoForm`, `TauCeti.SmoothForm`, `TauCeti.SmoothTwoForm.IsSymplectic`,
  `TauCeti.SmoothForm.mpullback`, `TauCeti.SmoothTwoForm.twistedProd`.
- *Matrix polar package (§2.0).* `Matrix.GeneralLinearGroup.existsUnique_posDef_mul_unitary`,
  `Matrix.GeneralLinearGroup.det_rpow_sqrt_mul_star_of_det_eq_one`,
  `Matrix.GeneralLinearGroup.det_polarUnitary_of_det_eq_one`, `Matrix.IsHermitian.cfc_log_exp`,
  `Matrix.PosDef.exp_cfc_log`, `Matrix.contDiffOn_cfc_log`,
  `Matrix.GeneralLinearGroup.contMDiff_sqrt_mul_star`,
  `Matrix.GeneralLinearGroup.contMDiff_coe_polarUnitary`,
  `Matrix.GeneralLinearGroup.polarDeformation`, `Matrix.GeneralLinearGroup.contMDiff_polarDeformation`,
  `Matrix.GeneralLinearGroup.polarDeformation_unitary_mul_mul_unitary`,
  `Matrix.GeneralLinearGroup.polarHomotopy`.
- *Matrix groups (§2.1).* `Matrix.realify`, `Matrix.realifyAlgHom`, `Matrix.realify_injective`,
  `Matrix.realify_conjTranspose`, `Matrix.commute_J_realify`, `Matrix.commute_J_iff_exists_realify_eq`,
  `Matrix.GeneralLinearGroup.realify`, `Matrix.GeneralLinearGroup.isClosedEmbedding_realify`,
  `Matrix.GeneralLinearGroup.realifyEquivRange`, `Matrix.GeneralLinearGroup.mem_range_realify_iff`;
  `TauCeti.GLSymplectic`, `TauCeti.isClosed_GLSymplectic`, `TauCeti.isClosed_unitarySubgroup_units`,
  `TauCeti.GLSymplectic.inf_unitarySubgroup`, `TauCeti.GLSymplectic.inf_range_realify`,
  `Matrix.GeneralLinearGroup.unitarySubgroup_inf_range_realify`,
  `Matrix.symplecticGroup_inf_orthogonalGroup`, `Matrix.unitaryGroupEquivSymplecticInfOrthogonal`,
  `Matrix.GeneralLinearGroup.isCompact_unitarySubgroup`,
  `TauCeti.GLSymplectic.isCompact_inf_unitarySubgroup`; `SymplecticGroup.rpow_neg_eq_J_conj_rpow`,
  `SymplecticGroup.rpow_mem`, `SymplecticGroup.sqrt_mul_star_mem`, `SymplecticGroup.polarUnitary_mem`,
  `SymplecticGroup.joinedIn_polarUnitary`; `Matrix.UnitaryGroup.instPathConnectedSpace`,
  `TauCeti.instPathConnectedSpaceMatrixGeneralLinearGroup`, `Matrix.isPathConnected_symplecticGroup`;
  `Matrix.GeneralLinearGroup.eq_unitarySubgroup_of_isCompact_of_le`,
  `TauCeti.GLSymplectic.eq_inf_unitarySubgroup_of_isCompact_of_le`,
  `TauCeti.GLSymplectic.maximal_isCompact_unitarySubgroup`,
  `Matrix.GeneralLinearGroup.range_realify_comp_toUnits`; `TauCeti.GLSymplecticFin`, `TauCeti.JFin`,
  `TauCeti.GLSymplecticFin.mulEquivGLSymplectic`, `TauCeti.GLSymplecticFin.mem_center_iff` (positive
  rank, any commutative ring); `TauCeti.GLSymplectic.cartanInvolution`,
  `TauCeti.GLSymplectic.coe_cartanInvolution`, `TauCeti.GLSymplectic.cartanInvolution_eq_self_iff`,
  `TauCeti.GLSymplectic.contMDiff_cartanInvolution` (any Lie group structure on Sp_R),
  `TauCeti.GLSymplectic.mfderiv_conj_symJ_one_apply`;
  `TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff_mem_sp`,
  `TauCeti.hasTrivialRadical_sp` (characteristic zero), `LieAlgebra.Symplectic.killingForm_apply`
  (characteristic other than two), `LieAlgebra.Symplectic.killingForm_cartanInvolution_self_neg`
  (ordered field); `TauCeti.Lie.isEmbeddedLieSubgroup_of_isClosed`,
  `TauCeti.Lie.isEmbeddedLieSubgroup_unitarySubgroup`.
- *Exact Lagrangians and examples (§2.2).* `TauCeti.SmoothTwoForm.IsNondegenerate.IsExactLagrangianMap`,
  `TauCeti.SmoothTwoForm.IsNondegenerate.IsExactLagrangianMap.exists_eq_add_const` (preconnected
  source), `Diffeomorph.isExactLagrangianMap_comp_iff`,
  `TauCeti.CotangentBundle.isExactLagrangianMap_zeroSection`,
  `TauCeti.CotangentBundle.isLagrangianMap_section_iff`,
  `TauCeti.CotangentBundle.exists_isExactLagrangianMap_section_iff` (finite-dimensional base);
  `TauCeti.CotangentBundle.conormal`, `TauCeti.CotangentBundle.conormalSpace`,
  `TauCeti.CotangentBundle.finrank_add_finrank_conormalSpace` (injective differential,
  finite-dimensional M), `TauCeti.CotangentBundle.conormal_comp_diffeomorph`,
  `TauCeti.CotangentBundle.image_cotangent_conormal`, `TauCeti.CotangentBundle.conormal_id`,
  `TauCeti.CotangentBundle.conormal_const`, `TauCeti.CotangentBundle.isExactLagrangianMap_of_conormal`
  (injective differentials, source of the dimension of M);
  `TauCeti.SmoothTwoForm.IsNondegenerate.isLagrangianEmbedding_graph_iff`,
  `TauCeti.SmoothTwoForm.IsNondegenerate.isLagrangianEmbedding_diagonal`;
  `TauCeti.CotangentBundle.symplecticForm_interior_vectorBundleEulerField`,
  `TauCeti.CotangentBundle.isLiouvilleVectorField_vectorBundleEulerField`, `TauCeti.IsLiouvilleVectorField`,
  `TauCeti.isMIntegralCurve_vectorBundleEulerField`,
  `TauCeti.IsLiouvilleVectorField.mpullback_globalFlow_eq_exp_smul` and
  `TauCeti.mpullback_globalFlow_eq_exp_smul_of_interior_eq` (complete C² field),
  `TauCeti.mpullback_globalFlow_eq_exp_smul`, `Diffeomorph.apply_flowOf_of_interior_eq` (Hausdorff
  boundaryless target, C¹ field); `Diffeomorph.existsUnique_cotangent_eq_of_mpullback_liouvilleForm`,
  `Diffeomorph.exists_cotangent_eq_iff_mpullback_liouvilleForm`;
  `TauCeti.SmoothTwoForm.isSymplectic_iff_forall_ne_zero_of_finrank_eq_two`,
  `TauCeti.Manifold.Orientation.ofTopForm`; `TauCeti.CotangentBundle.isLagrangianMap_section_torusTimeForm`,
  `TauCeti.CotangentBundle.not_exists_isExactLagrangianMap_section_torusTimeForm`;
  `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv` (path-connected space);
  `TauCeti.CotangentBundle.cosphereBundle`, `TauCeti.SmoothForm.IsContactForm`,
  `TauCeti.CotangentBundle.isContactForm_mpullback_neg_liouvilleForm_cosphereBundle`,
  `TauCeti.CotangentBundle.isContactForm_mpullback_liouvilleForm_cosphereBundle`,
  `TauCeti.CotangentBundle.mfderiv_coe_reebVectorField_cosphereBundle`,
  `TauCeti.CotangentBundle.coe_flowOf_reebVectorField_cosphereBundle`,
  `TauCeti.CotangentBundle.mfderiv_coe_reebVectorField_neg_cosphereBundle`,
  `Diffeomorph.cosphereRadial`, `Diffeomorph.kerDistribution_mpullback_cosphereRadial_liouvilleForm`,
  `Diffeomorph.pos_mpullback_cosphereRadial_liouvilleForm_iff`,
  `Diffeomorph.pos_mpullback_cosphereRadial_neg_liouvilleForm_iff`.
- *Tangent-image predicates (§2.3).* `TauCeti.SmoothTwoForm.IsNondegenerate.HasSymplecticTangentImages`,
  `TauCeti.SmoothTwoForm.IsNondegenerate.IsIsotropicMap`,
  `TauCeti.SmoothTwoForm.IsNondegenerate.IsCoisotropicMap`,
  `TauCeti.SmoothTwoForm.IsNondegenerate.IsLagrangianMap`,
  `TauCeti.SmoothTwoForm.IsNondegenerate.IsLagrangianEmbedding`,
  `TauCeti.SmoothTwoForm.IsNondegenerate.isLagrangianEmbedding_iff_of_isSmoothEmbedding`,
  `TauCeti.SmoothTwoForm.IsNondegenerate.IsLagrangianImmersion` and the laws named in §2.3, for the
  three predicates and for symplectic tangent images (parametrization, transport by
  symplectomorphisms, dimension counts, products of nonempty sources, open restriction and open
  covers of differentiable maps, rescaling by c ≠ 0), `Diffeomorph.isLagrangianEmbedding_comp_diffeomorph_iff`,
  `Diffeomorph.isLagrangianEmbedding_diffeomorph_comp_iff`,
  `TauCeti.SmoothTwoForm.IsNondegenerate.IsLagrangianEmbedding.prodMap`,
  `TauCeti.SmoothTwoForm.IsNondegenerate.IsLagrangianImmersion.prodMap`; the linear facts
  `TauCeti.SymplecticForm.orthogonal`, `TauCeti.SymplecticForm.mem_orthogonal_iff'`,
  `TauCeti.SymplecticForm.finrank_orthogonal`, `TauCeti.SymplecticForm.orthogonal_orthogonal`,
  `TauCeti.SymplecticForm.isIsotropic_iff`, `TauCeti.SymplecticForm.IsIsotropic.two_mul_finrank_le`,
  `TauCeti.SymplecticForm.IsLagrangian.two_mul_finrank`,
  `TauCeti.SymplecticForm.IsIsotropic.isLagrangian_of_finrank`,
  `TauCeti.SymplecticForm.finrank_add_finrank_orthogonal`,
  `TauCeti.SymplecticForm.IsCoisotropic.finrank_le_two_mul_finrank`,
  `TauCeti.SymplecticForm.isLagrangian_iff_maximal_isIsotropic`,
  `TauCeti.SymplecticForm.isSymplectic_iff_nondegenerate_restrict`,
  `TauCeti.SymplecticForm.isSymplectic_iff_disjoint`, `TauCeti.SymplecticForm.isSymplectic_iff_isCompl`,
  `LinearMap.BilinForm.finrank_le_finrank_add_finrank_orthogonal`,
  `LinearMap.BilinForm.finrank_le_two_mul_finrank_of_orthogonal_le`, in the module
  `TauCeti.Geometry.Symplectic.Lagrangian.Basic` and its neighbours.
- *Correspondences and generating functions (§3.0, §3.0a).*
  `TauCeti.SmoothTwoForm.IsNondegenerate.IsLagrangianEmbedding.swap_comp`,
  `TauCeti.SmoothTwoForm.IsNondegenerate.IsLagrangianEmbedding.prodProdProdComm_comp_prodMap`,
  `TauCeti.SymplecticForm.IsLagrangian.relComp` (finite dimension); `TauCeti.cotangentGeneratingSource`,
  `TauCeti.cotangentGeneratingTarget`, `TauCeti.cotangentMixedHessian`,
  `TauCeti.isInvertible_fderiv_cotangentGeneratingSource_iff`, `TauCeti.cotangentGeneratingBranch`,
  `TauCeti.cotangentGeneratedMap`,
  `TauCeti.eventually_strongDualCotangentSymplecticForm_fderiv_cotangentGeneratedMap`,
  `TauCeti.eventually_cotangentLiouvilleForm_sub_cotangentGeneratedMap`,
  `TauCeti.eventually_isInvertible_fderiv_cotangentGeneratedMap` (finite dimension),
  `TauCeti.cotangentPartialLegendre`, `TauCeti.cotangentLegendreChart`,
  `TauCeti.eventually_fderiv_cotangentPartialLegendre`, `TauCeti.cotangentThirdKindLegendre`,
  `TauCeti.eventually_fderiv_cotangentThirdKindLegendre`, `TauCeti.cotangentFourthKind`,
  `TauCeti.eventually_fderiv_cotangentFourthKind`, `TauCeti.cotangentLegendreHessian`,
  `TauCeti.cotangentSourceHessian`, `TauCeti.cotangentMomentumHessian`,
  `TauCeti.exists_cotangentGeneratingComposition`,
  `TauCeti.isLagrangianImmersion_cotangentGeneratingSource_comp_coe` (finite dimension, transverse
  fibre derivative), `TauCeti.cotangentGeneratedMap_freeParticleGeneratingFunction_eventuallyEq` (real
  Hilbert space, t ≠ 0), `TauCeti.cotangentGeneratedMap_oscillatorGeneratingFunction_eventuallyEq`
  (t ∉ πℤ), `TauCeti.not_isInvertible_oscillatorPositionProjection_iff`; `TauCeti.mixedHessian`,
  `TauCeti.mixedHessian_apply_eq_of_mem_maximalAtlas`,
  `TauCeti.isInvertible_mixedHessian_iff_of_mem_maximalAtlas`, `TauCeti.mixedHessian_comp_swap_apply`
  (C² atlases). The normed-space statements assume V and W complete where the inverse function
  theorem is used and S of class C² at the base point.
- *Relative germs (Layer 4).* `TauCeti.homotopyOperator`,
  `TauCeti.mextDeriv_homotopyOperator_add_homotopyOperator_mextDeriv` (the identity
  ι₁*ω − ι₀*ω = d(hω) + h(dω) for a C¹ form on a C² manifold, boundary allowed),
  `TauCeti.mextDeriv_homotopyOperator`, `TauCeti.IsSmoothForm.homotopyOperator` (C^r regularity on a
  C^(r+1) manifold); `TauCeti.fiberwisePoincareHomotopy`,
  `TauCeti.fiberwisePoincareHomotopy_zeroSection`, `Convex.extDeriv_fiberwisePoincareHomotopy` and
  `Convex.exists_contDiffOn_relative_primitive` (forms on a product E × N of normed spaces with
  values in a normed space F, complete for the last two: the fibre-scaling operator K vanishes at
  every (q, 0); on an open convex set stable under (q, p) ↦ (q, tp) for t ∈ [0, 1], a closed C¹ form
  ω satisfies dKω = ω − r*ω with r(q, p) = (q, 0), and a closed C^r form, 1 ≤ r ≤ ∞, whose restriction
  to the zero section vanishes has a C^r primitive vanishing at every (q, 0));
  `TauCeti.SmoothEmbedding.NormalSpace` and
  `TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_subset` (the tubular neighbourhood
  theorem: for a smooth embedding between finite-dimensional boundaryless manifolds, the target
  Hausdorff and second countable, the normal bundle is diffeomorphic to an open neighbourhood of the
  image inside any prescribed one, the zero section going to the embedding);
  `TauCeti.SymplecticForm.exists_isSymplectomorphism_extend_linearEquiv`
  (finite-dimensional symplectic spaces of equal dimension, a linear isomorphism between arbitrary
  subspaces carrying one restricted form to the other).

### From TauCetiRoadmap.HeegaardFloer

§4.1 (F2.1): Darboux's theorem (`exists_darbouxChart`), Moser's theorem on compact
finite-dimensional Hausdorff manifolds with a given smooth symplectic path, the domain-local Moser
lemma for a smooth symplectic family, the smooth-parameter local primitive selection from
DifferentialGeometry §5.4, and the time-dependent pullback differentiation identity; used in §4.1,
§4.2 and §4.4 exactly as stated there.

### From TauCetiRoadmap.DifferentialGeometry

Layer 3 (maximal flows of vector fields, their domains and naturality), used in §2.2; Layer 4 (distributions,
Frobenius and leaves), used in §4.8; §5.4 (the naturality under pullback of the homotopy operator on M × [0, 1], whose identity and
regularity are Tau Ceti's), used in §4.1; Layer 8 (the de Rham theorem), used in
§2.2.

### From TauCetiRoadmap.GeometricTopology

§1.5 (uniqueness of tubular neighbourhoods up to isotopy, and the straight-line retraction of a
tube onto the submanifold in the fibres), on Tau Ceti's tubular neighbourhood theorem; used in
Layer 4.

### From TauCetiRoadmap.SmoothBundlesConnections

§B1.2 (pullbacks of bundles), used in §2.2; §B1.4 (slices and quotients: the smooth structure on
the quotient by a free proper action, here of a discrete group), used for the Kodaira–Thurston
manifold in §2.2; §B2.1 (dual, tensor and Hom bundles), used in §2.2 and §4.8; Layers 2–4
(associated bundles and fibre metrics, principal and induced connections, curvature), used in §4.6;
Layers 3 and 5 (induced connections and parallel transport), used in §4.5.

### From TauCetiRoadmap.RepresentationTheory.LieGroups

Layer 2 (the closed-subgroup theorem), whose Tau Ceti form is
`TauCeti.Lie.isEmbeddedLieSubgroup_of_isClosed`, used in §2.1 item 4; Layer 9 (the global
matrix-cover model, its adjoint-model construction for a connected semisimple group with finite
centre and a positive integrated Cartan involution, and the matrix-model polar and maximality
theorem for a closed transpose-stable H ≤ GL_N(ℝ)), used in §2.1 items 5 and 6.

### From TauCetiRoadmap.ComplexKahlerGeometry

§6.3 (K6.1, compact Kähler Hodge theory): the degree-one harmonic and type decomposition,
conjugation symmetry, and evenness of the odd real Betti numbers of a compact boundaryless Kähler
manifold; used in §2.2.

### From Completed.UniversalCovers

Stages 1–2: the isomorphism of the deck group of the universal cover with π₁, the lifting criterion
and the Galois correspondence of covers; used in §2.2.

### From TauCetiRoadmap.SymplecticGeometry.ContactGeometry

CG1: the contact predicate on cooriented one-forms, used for the two signed cosphere forms of §2.2.

## References

- A. Cannas da Silva, [*Lectures on Symplectic Geometry*](https://people.math.ethz.ch/~acannas/Papers/lsg.pdf),
  §§2–8 (cotangent forms, Lagrangians, Darboux–Moser–Weinstein), §11 (contact example); in
  particular Prop. 5.1, Prop. 5.2 and §5.2 (generating functions of iterates, billiards), Thm. 5.3
  (recurrence), Thm. 6.5 (tubular neighbourhoods), Prop. 6.8 (relative Poincaré lemma), Thm. 7.4
  (relative Moser), Thms. 8.1, 8.4, 8.6 and 9.3 (Darboux, Lagrangian and coisotropic
  neighbourhoods; Thm. 8.4 is Weinstein's Lagrangian neighbourhood theorem) and Thm. 9.1 (the normal
  bundle of a Lagrangian). Page numbers are those of the author's 2006 version. The cotangent-lift
  Hamiltonian identity is the exercise in §18.1, p. 106.
- M. J. Gotay, [*On coisotropic imbeddings of presymplectic manifolds*](https://www.ams.org/journals/proc/1982-084-01/S0002-9939-1982-0633290-X/S0002-9939-1982-0633290-X.pdf),
  Proc. Amer. Math. Soc. 84 (1982), 111–114; the Local Uniqueness Theorem (p. 111, proof in §III,
  p. 113).
