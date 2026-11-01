# Roadmap: schubert geometry, Demazure sections and flag K-theory

**Summary.** Build the scheme and section interfaces for Schubert varieties in general reductive flag varieties: relative incidence and universal bundles, root-coordinate cells and their closures, all-word Bott–Samelson operations, dominant line-bundle cohomology, compatible Frobenius splitting, all-degree standard monomial theory, exact divisor multiplicities and algebraic flag K-rings. The finite-type LS-chain/path engine and its geometric section comparison are part of this construction. Compare the complex realization with holomorphic Lefschetz characters and the existing finite Grassmannian topology. Suggested homes are `TauCeti/AlgebraicGeometry/Schubert/` and `TauCeti/RepresentationTheory/LSPath/`.

Use schemes, sheaves of modules, root data and rational representations at their stated hypotheses. A point-set rank condition is a comparison interface for a scheme, not its definition as a variety. Singular Schubert varieties are not declared smooth.

## Scope and ownership

This roadmap owns the general finite-root-datum path theory, Schubert schemes,
word resolutions, geometric sections, splitting, standard monomial theory,
Chevalley divisors and flag K-rings. The relative Grassmannian, generic coherent
cohomology and representation-theoretic foundations have the owners
listed in the supplier contracts below. S1.0–1 owns the relative parabolic
quotients and finite-locally-free flag incidence needed here; S2 owns the
integral word models and S5.6 their Schubert closure and base-change theory.
S9.0 owns the coherent analytic foundations required for S9, including
nonreduced analytification and proper GAGA. These are prerequisites of the
base programme. Ordinary holomorphic Picard groups,
the root-degree basis and the compact character-to-degree forgetful map belong
to GeometricQuantization §§3.3–3.4. S9.8 retains only the algebraic-to-holomorphic
equivariant-line adapter, with specified transition functions and fibre maps.
The type-A coordinate-path comparison
and tableau applications are downstream consumers of the general path theory.

## Conventions

Fix a split connected reductive group G over a field k, a pinning when root coordinates are used, T⊂B+ with positive roots Φ+, and the opposite Borel B−. Write X=X*(T), Y=X_*(T), with their actual perfect pairing, W for the Weyl group and I for the simple roots. Keep the central lattice and the isogeny type. Unless separately specified, flags mean right quotients G/P−, with P− containing B−. Minimal representatives belong to W/W_P. The standard Schubert cell is C(w)=B−wP−/P− and X(w) is its schematic closure; its dimension is ℓ(w), e is closed and the longest minimal representative is open. Opposite Schubert loci use B+. Convert left quotients and positive-Borel sources by explicit inversion/opposition maps. An unqualified Schubert union is a finite union for this one fixed Borel, or for one common opposite Borel after the stated transport. Mixed standard/opposite families are named explicitly and retain their own ideal and cohomology conditions.

For λ∈X, the associated line L(λ)=G×^(B−)k_λ has fibre character λ at e. Sections are regular functions f(gb)=λ(b)^−1f(g), with (g·f)(x)=f(g^−1x). Dominant λ have nonnegative pairings with simple coroots; for descent to G/P− require zero pairings on its Levi simple roots. The rank-one restriction has degree ⟨λ,α_i∨⟩. Thus H⁰(G/B−,L(λ)) is ∇(λ), whereas ordinary Δ(λ)* is ∇(−w₀λ). Distinguish this from the pinned contravariant dual D_τΔ(λ)=∇(λ).

Over an arbitrary base S, relative finite-locally-free flags and incidence schemes have their universal functorial meanings. Group flag forms use their actual descent type; individual fundamental line bundles or a chosen pinning need not descend. Integral split calculations use the pinned Chevalley model and its actual character/cocharacter lattices. Characteristic-p splitting is first constructed over perfect fields, including p=2; field extensions and descent are proved before using it for geometric conclusions over other fields. Over a nonreduced S, geometrically reduced fibres do not make the total space reduced.

## Exact supplier contracts

### From Mathlib

The native `Module.Grassmannian` and `Module.Basis.flag` supply the module
points and basis flag, not the relative Schubert schemes. They are defined in
`Mathlib/RingTheory/Grassmannian.lean` and
`Mathlib/LinearAlgebra/Basis/Flag.lean`. The Grassmannian requires a finite
projective quotient of constant stalk rank; it does not supply a scheme
representing that functor. For the symplectic coordinate comparison use
`Matrix.J` and `SymplecticGroup.mem_iff'` in
`Mathlib/LinearAlgebra/SymplecticGroup.lean`.

### From the named roadmap suppliers

- [ModularCurves §0G](../ModularCurves/README.md) owns finite-locally-free Grassmannian representability, its charts and universal quotient. Native `Module.Grassmannian R M q` stores a submodule with locally free quotient of rank q; an r-dimensional subspace of k^N corresponds to q=N−r. S1.1 constructs flags as closed incidence subschemes of products of those Grassmannians; a coherent quotient of a non-locally-free sheaf is not needed for this construction.
- [ReductiveGroups](../ReductiveGroups/README.md) owns Hopf/scheme/point and rational-comodule dictionaries, group/root/pinning/central-isogeny structure, and field Bruhat theory. Its integral-distribution/rational-representation extension supplies full-lattice divided-power PBW/Dist(G), Δ/∇/L, induction, pinned extremal vectors and contravariant duality. The algebraic Steinberg input is the simple module Δ((p−1)ρ)=L((p−1)ρ)=∇((p−1)ρ) on the derived simply connected cover, with dimension p^|Φ+| and normalized PBW/extremal pairing. These algebraic constructions do not consume flag splitting or SMT.

- [GroebnerGeometry G5](../GroebnerGeometry/README.md) owns polynomial minor/shuffle/straightening/Gröbner statements, flag-minor algebra and its GT initial algebra. S6 supplies the scheme, homogeneous coordinate, section and restriction identifications. The original flag algebra is not identified with its toric initial algebra.
- [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) supplies generic coherent cohomology, ample Serre, relative derived pushforward/base change and coherent/perfect K-theory at its stated scope; [StableReduction Layer2](../StableReduction/README.md) supplies relative Proj using AlgebraicVectorBundles L2A's single graded quasicoherent algebra and affine-ring interfaces. AlgebraicVectorBundles supplies tensor, dual, exterior and determinant sheaves and their pullbacks. These generic constructions are not redefined here.
- [TopologicalKTheory T1.5](../TopologicalKTheory/README.md) supplies the single finite subspace Grassmannian and finite Schubert characteristic maps. LieGroups supplies compact full flags and their homogeneous complex comparisons. S9 compares these with the algebraic models; it does not rebuild their existing carriers.
- [IndexTheory I8](../IndexTheory/README.md) owns the generic holomorphic fixed-map trace construction, in addition to its Dolbeault/Hodge and equivariant index machinery. S9 owns the flag/Bott–Samelson specialization and its section-action convention.
- [ComplexKahlerGeometry K3–K4](../ComplexKahlerGeometry/README.md) supplies finite-dimensional holomorphic germs, Weierstrass division, local analytic sets and the holomorphic sheaf/bundle calculus. S9.0 extends these local objects to analytic spaces with nilpotents and coherent analytification; K4's bundle theory alone is not coherent GAGA. RealAnalyticGeometry R3.2 supplies the native coherent module-sheaf predicate, coherent kernels and Cartan A/B on Stein manifolds. SchemeAndStackFoundations §§2.2, 2.6 and 4.12 supply algebraic coherent pushforward, projective-space cohomology and Chow modification for its proof.

## How to read the build

Construct in this order: S1's relative carriers and early root cells; S2's word/incidence API; S3's early line bundles and rank-one derived push-pull; S4.1–5's root-data LS combinatorics; S5's splitting/normalization/coherent comparisons; S7.1–2's divisor valuations; S4.6–7 and S6's geometric path sections and all-degree bases; S7.3's cycle comparison; S8's K-rings; S9's analytic and existing-owner comparisons. S4.1–5 is independent of Schubert splitting, vanishing, SMT and the concrete typeA implementation. S4.6–7 is its geometric application, after S5 and S7.1–2. The generic finite-type engine is the single root-data owner; S9.5 gives its type-A root-datum specialization. The algebraic Steinberg supplier is independent of all these geometric conclusions. The analytic fixed-point argument is a later comparison, not a premise for algebraic vanishing or SMT.

Suggested.lean lists the headline theorems and the carriers missing at the pins.
The API targets and worked calculations belong to this README.

## Layer 1: Relative incidence and the root-cell dictionary (S1)

### 1.0 Relative parabolic quotients and integral root cells

For a reductive group scheme G over any scheme S and an étale-locally constant
parabolic type t invariant under descent, construct the scheme Par_t(G) of
parabolic subgroup schemes of that type. It is smooth and proper over S, has
its universal parabolic, and carries the relatively ample line
det(Lie(P_univ))*; it is projective over affine S. For a parabolic P/S of
type t, construct G/P→Par_t(G), gP↦gPg⁻¹, as an isomorphism of the represented
étale (equivalently fppf) quotient with that type component. Prove schematic
self-normalization of P before using this orbit map (ConradReductive,
Theorem 2.3.6, pp. 72–73, and Corollaries 5.2.8–5.2.9, pp. 155–157).
The Borel-type case agrees with ReductiveGroups Layer 8’s Borel scheme by
its representing property; it is not a second Borel carrier.

- Pullback of the universal subgroup represents change of base along every S′→S.
- Conjugation, quotient projection and change of a chosen parabolic commute
  with pullback and satisfy the composition laws on subgroup functors.
- The ample line is the dual determinant of the universal parabolic Lie algebra;
  arbitrary characters and their associated lines are treated separately in S3.

**Checks.**

- For GL₂ over ℤ, the Borel component is ℙ¹ and the canonical line has degree 2,
  whereas the weight-one associated line has degree 1.
- For P=G, the component is S and the quotient map has a single geometric point
  in every fibre; for a torus there is no positive-dimensional flag component.
- For the adjoint group of the Hamilton quaternion algebra over ℝ, the Borel
  component is the conic x²+y²+z²=0: it has no real point and becomes ℙ¹ over ℂ.
  A relative flag scheme need not admit a section.

For the split pinned ℤ-model of ReductiveGroups Layer 9, construct the standard
parabolics, their above quotients and the root-product charts. An ordered
inversion-root product gives a locally closed cell isomorphic to affine
ℓ(w)-space over ℤ; the cells exhaust the underlying flag space and commute
with arbitrary base change. Derive this from root multiplication and the
open big cell, followed by field Bruhat on every geometric fibre
(ConradReductive, Theorem 5.1.13, p. 143; ReductiveGroups Layer 7).
This is a stratification, not an isomorphism from the disjoint union of cells.
S2 constructs the contracted products over ℤ and then their base changes;
S5.6 proves closure base change without using it as a premise here.

- Cell charts, their inverses on their images and parabolic projections retain
  the chosen normalizer representatives and right-coset convention.
- Base change preserves the charts and their root-coordinate transition maps,
  including over nonreduced bases and at primes 2 and 3.
- Twisted models descend the quotient and its maps, without asserting that
  individual split cells descend when their indices are permuted.

**Checks.**

- On ℙ¹ the closed cell has one point and the open cell has q points over 𝔽_q;
  for q=2,3 their totals are 3,4, not 2 and not an affine-line count.
- For GL₃’s complete flag the cell lengths are 0,1,1,2,2,3; their 𝔽₂-point
  total is 1+2+2+4+4+8=21. A maximal partial flag gives 1+2+4=7 instead.
- Over ℤ[ε]/(ε²), the open rank-one chart is Spec(ℤ[ε][z]/(ε²)); ε remains
  nonzero although each geometric fibre is reduced.

*Needs:* ReductiveGroups Layers 7–9 (parabolics, relative descent and split
pinned groups); SchemeAndStackFoundations Layer 1 (scheme gluing and descent).

### 1.1 Finite-locally-free flags and incidence

For a finite locally free E/S and a strictly increasing admissible rank list, construct the universal relative flag with subbundles F_i and locally free quotients as the closed incidence subscheme of the product of ModularCurves §0G quotient Grassmannians. Export empty/single/full flag comparisons, tautological exact sequences, tensor/exterior/determinant pullbacks, forgetful maps, refinement-parameter schemes, annihilator flags in E*, and arbitrary base change. An opposite flag in E needs the displayed splitting/pairing or opposite-Borel data; no canonical opposite/refinement of an arbitrary flag is assumed. Cut out that closed immersion by the vanishing of the universal maps F_i→E/F_j for i<j; prove that the source's coordinate model and forgetful/refinement maps identify with those same maps. The product is an ambient space, not the flag itself. On a chosen splitting, compare these sheaf maps with polynomial matrix incidence equations. The construction is a deduction from the Grassmannian universal quotient and the closed zero locus of these maps (ModularCurves §0G; SchemeAndStackFoundations Layer 1).

- The universal incidence equations represent nested locally direct summands;
  their functor of points identifies the immersion with the flag functor.
- Forgetting ranks, pulling back E and taking annihilators preserve the
  incidence equations, tautological exact sequences and quotient ranks.
- Iterated Grassmannian presentations give smooth projective flag bundles;
  refinement is a flag bundle of the specified successive quotients.

**Checks.**

- The empty rank list gives S; a single rank r gives the quotient-rank N−r
  Grassmannian, so ranks 0 and N give S rather than an empty scheme.
- In rank 3 with ranks (1,2), the product has dimension 2+2=4, while the flag
  has dimension 3: the scalar incidence equation is essential.
- Over k[ε]/(ε²), the line generated by e₁+εe₃ and plane spanned by e₁,e₂
  give incidence value ε≠0. Their reduced points are nested, but the two
  subbundles do not form a flag; testing only geometric points loses the ideal.

*Needs:* ModularCurves §0G; AlgebraicVectorBundles tensor/dual sheaves;
SchemeAndStackFoundations Layer 1 closed immersions and base change.

### 1.2 Root-cell dictionary

Use S1.0’s Par_t(G), actual G/P− and integral root-coordinate charts. Construct the full source-to-model dictionary: standard and opposite cells, minimal coset representatives, chosen normalizer representatives, T-fixed points, inversion sets, relative dimension and parabolic projection. The left/right quotient map is P−g↦g^−1P− and on Weyl indices W_Pw↦w^−1W_P; prove its root-coordinate and associated-line character formulas before using the source's left-coset statements. The fixed scheme is the finite disjoint union of the indicated sections in the split model; do not identify a general twisted form with that split list. Use actual root subgroup multiplication and quotient universal properties, not merely the cardinality of the Weyl group. Include rank-zero groups, P=G, empty root systems and nontrivial central tori.

- Quotient inversion sends each Weyl coset to its inverse coset and intertwines the actual quotient actions.
- The torus-fixed section indexed by w retains the chosen normalizer representative.
- Parabolic projection respects charts and forgets the indicated flag steps.

**Checks.**

- For S₃, inversion sends (123) to (132), and applying it twice returns (123).
- For a torus the flag has one point and dimension 0, even with nonzero character lattice.
- A GL₃ full flag has six torus-fixed points, while a maximal partial flag has three; projection must identify pairs.

*Needs:* S1.0; ReductiveGroups Layers 7–9. The quotient inversion formulas follow directly from the quotient universal property; the cells use ConradReductive Theorem 5.1.13 and field Bruhat separately.

### 1.3 Type-A ranks and pivots

In typeA, compare row/column conventions, a rank-r subspace with quotient rank N−r, one-based pivots p₁<⋯<p_r and actual zero-based `Fin N` coordinates p_i−1. The increasing basis flag has dim(V∩F_j)=#{i:p_i≤j}; cell dimension is Σ_i(p_i−i). For the rectangle partition λ_i=N−r+i−p_i, this is r(N−r)−|λ|. Rank0/full rank are points and r>N is empty. For N≤1 use the direct point/empty cases, without an A₀/A_(−1) root reference.

- Pivot positions agree with intersections with each step of the specified basis flag.
- The partition and pivot formulas give the same cell dimension.
- Subspace rank r is transported to quotient rank N−r only when r≤N.

**Checks.**

- In Gr(2,4), pivots (1,2),(1,3),(3,4) give dimensions 0,1,4 and partition sizes 4,3,0.
- For N=0, rank 0 gives a point, whereas rank 1 is empty; truncated subtraction cannot identify both with quotient rank 0.
- A line with pivot 2 in k² meets the first basis line in dimension 0 and the full plane in dimension 1.

*Needs:* S1.1–1.2; Mathlib module flags and rank. The pivot calculation is BrionFlags §1.1, pp. 4–5, after Definition 1.1.2; the same echelon-coordinate calculation works over every field and is expressed here in quotient-rank coordinates.

### 1.4 Determinantal incidence

Construct the determinantal rank-condition schemes relative to an actual complete subbundle flag; compare them with S5.6’s Schubert closures on S1.0’s locally split integral flag model, after that closure comparison has been proved. Give their universal ideals, restrictions, saturation/homogeneous presentations, base change and cell decompositions. Two or more arbitrary relative flags give well-defined incidence schemes but not automatic flatness, expected codimension or smooth resolutions. State and prove each such conclusion with its actual versality/transversality/regular-sequence assumptions.

- The defining ideal is generated by the minors of the universal bundle maps of the specified sizes.
- Base change pulls back those actual ideals, not just their geometric zero sets.
- The closure comparison is asserted for a single complete flag; multiple flags retain their stated incidence conditions.

**Checks.**

- Over k[ε]/(ε²), the line e₁+εe₃ and plane span(e₁,e₂) give the nonzero incidence ideal (ε), although the reduced incidence value is 0.
- A minor size exceeding either matrix dimension contributes no generators, hence ideal 0 rather than the unit ideal.
- For the identity complete flag in k², the closed Schubert locus is its specified line and the longest Schubert locus is all ℙ¹.

*Needs:* S1.1–1.3; SchemeAndStackFoundations Layer 1 closed immersions and AlgebraicVectorBundles exterior powers; S5.6 only for the Schubert-closure comparison. The determinantal functor follows from vanishing of exterior powers of the universal maps.

### 1.5 Symplectic isotropic flags

Retain the symplectic exercise: for a nondegenerate alternating form, prove dim U≤m for isotropic U⊂k^(2m), and construct the isotropic Grassmannian as the universal zero locus of the restricted form on the tautological bundle. Compare its split group quotient, transitivity, parabolic stabilizer and dimension r(2m−r)−r(r−1)/2, including characteristic2 with an actual alternating form. Rank0 is a point and r>m is empty. Distinguish orthogonal characteristic2/non-smooth stabilizer issues. General root-type flag examples use the actual corresponding reductive model.


   **Symplectic stabilizer in the exercise coordinates.** For 0≤r≤m put
   s=m−r and take the source form
   `Q_src=[[0,H_m],[−H_m,0]]`, where H_m has ones on its antidiagonal.
   In one-based coordinates set u_i=e_i and f_i=e_(2m+1−i).
   Let C have ordered columns
   `(u_1,...,u_r; u_(r+1),...,u_m,f_(r+1),...,f_m; f_1,...,f_r)`.
   Prove `Cᵀ Q_src C=J_(r,s)`, where
   ```
   J_(r,s) = [[0,0,I_r],[0,J_0,0],[−I_r,0,0]],
   J_0     = [[0,I_s],[−I_s,0]].
   ```
   Give the actual permutation/reindexing maps to `Fin (2*m)` and the
   sum-indexed native symplectic carrier. The native
   `Matrix.J`
   is `[[0,−I],[I,0]]`; prove the global-negation and permutation comparisons,
   using `SymplecticGroup.mem_iff'` for the column-action equation.

   In these coordinates prove that the stabilizer P_r of
   `U=span(u_1,...,u_r)` consists exactly of the block upper-triangular
   symplectic matrices for block sizes (r,2s,r). Preservation of U forces
   preservation of U-perp=U⊕W_0. Construct the Levi homomorphism
   `l(A,D)=diag(A,D,A^(−T))`, with A∈GL_r and D∈Sp(W_0,J_0),
   and the unipotent matrices
   ```
   u(Y,Z) = [[I_r,YᵀJ_0,Z],[0,I_(2s),Y],[0,0,I_r]],
   Y : Matrix (Fin (2*s)) (Fin r) k,
   Z : Matrix (Fin r) (Fin r) k,
   Z−Zᵀ = YᵀJ_0Y.
   ```
   Prove every element of P_r has a unique factorization u(Y,Z)l(A,D),
   with inverse coordinate extraction from its blocks. Export the laws
   ```
   (Y,Z)(Y',Z') = (Y+Y', Z+Z'+YᵀJ_0Y'),
   (Y,Z)⁻¹      = (−Y,−Zᵀ),
   l(A,D)u(Y,Z)l(A,D)⁻¹ = u(DYAᵀ,AZAᵀ).
   ```
   Identify this kernel as the unipotent radical and construct the split
   projection P_r→GL_r×Sp_(2s), its section and the resulting semidirect
   product on the existing group-scheme/point carriers. Prove the block
   maps and their equations commute with field extension and base change.
   Since YᵀJ_0Y is alternating, choose its strictly upper-triangular part
   Z_0, with `Z_0−Z_0ᵀ=YᵀJ_0Y`; then Z−Z_0 is symmetric.
   This gives affine coordinates of dimension `2sr+r(r+1)/2` on the
   unipotent radical in every characteristic. No division by2 is used.
   Recover the isotropic-Grassmannian dimension above from this stabilizer.
   At r=0 obtain P_0=Sp_(2m) and trivial radical; at r=m obtain
   GL_m acting on the additive symmetric matrices by Z↦AZAᵀ.
   Compare this positive-coordinate parabolic with the roadmap's negative
   quotient convention by its pinned opposition map before assigning a
   root subset or Schubert index.

- The isotropic zero locus and parabolic stabilizer retain the alternating form and their change-of-basis maps.
- The unique unipotent–Levi factorization has the displayed multiplication, inverse and conjugation laws.
- The root-chart comparison works in characteristic 2, using the upper-triangular part instead of division by 2.

**Checks.**

- For m=2, isotropic ranks 0,1,2 have dimensions 0,3,3, and rank 3 is empty.
- With r=s=1, Y=(1,2), Y′=(3,4), Z=5 and Z′=6, one has YᵀJ₀Y′=−2 and the product coordinates are ((4,6),9); reversing the symplectic sign would give 13.
- At r=m the Y block is empty and the unipotent group is the additive symmetric m×m matrices; at r=0 it is the trivial group.

*Needs:* S1.1–1.2; ReductiveGroups parabolic stabilizers; Mathlib `Matrix.J` and `SymplecticGroup.mem_iff'`. The displayed block identities are deductions by matrix multiplication and the alternating-form rank bound; no coordinate formula uses division by 2.

### Examples

For Gr(2,4), pivots (1,2), (1,3) and (3,4) have dimensions 0, 1 and 4. The empty and full subspaces each give one point. For a symplectic four-space the Lagrangian rank is 2 and its isotropic Grassmannian has dimension 2(4−2)−2(2−1)/2=3.

### Dependencies

ModularCurves §0G; ReductiveGroups Layers 7–9; SchemeAndStackFoundations Layer 1 descent and closed subschemes. S1.4’s closure identification additionally uses S5.6; the incidence construction itself does not.

## Layer 2: All-word Bott–Samelson and crank interfaces (S2)


### 2.1 Left and right cranks

For each simple root use the actual minimal parabolic P_i− and projection G/B−→G/P_i−. For X→G/B− construct the right crank X×_(G/P_i−)G/B−, a P¹-bundle over X; construct the left crank P_i−×^(B−)X, an X-bundle over P¹, with its map to G/B− when X is a B−-space. Distinguish the two projection directions, group actions and universal properties. The right projection is smooth proper of relative dimension1; if X is smooth/proper over k, so is its total space in the corresponding assertion. The left construction is locally an X-bundle over P¹ and inherits smoothness/properness over k when X has that property. Export their base-change and equivariance laws; no absolute properness is asserted for an arbitrary nonproper X.

The two constructions have separate universal maps: the right crank is a fibre product, and the left crank is an associated bundle.

- Their projections and structure maps commute with base change.
- The right projection has relative dimension 1, independently of the dimension of X.
- The left action descends from multiplication on P_i− and the given B− action on X.

**Checks.**

- With X the identity flag, either construction is ℙ¹ of dimension 1.
- For X=𝔸¹ with constant structure map, the right crank is 𝔸¹×ℙ¹; it is proper over 𝔸¹ but not over k.
- For X empty both constructions are empty; a disjoint extra ℙ¹ would violate the fibre-product and associated-bundle descriptions.

*Needs:* S1.0–1.2; SchemeAndStackFoundations Layer 1 fibre products and descent. The bundle assertions follow by trivializing the rank-one quotient.

### 2.2 Word schemes

For every finite word i₁…i_r, including empty and nonreduced words, construct the integral iterated-rank-one model as the contracted product P_i₁−×^(B−)…×^(B−)P_ir−/B−. Construct its quotient charts, scheme structure, iterated P¹-bundle maps, universal flag-chain description and multiplication map π to G/B−. Fix factor order and compare the crank order used in the handout. Prove dimension r, smoothness/properness, the B−/T actions, and base-change compatibility. No reducedness of the word is required for these constructions.

- Successively forgetting the last factor gives the specified P¹-bundle tower.
- Multiplication sends the class of (p₁,…,p_r) to p₁⋯p_r B− and is independent of quotient representatives.
- Charts and flag-chain maps commute with arbitrary base change.

**Checks.**

- The empty word is the identity flag, with dimension 0 and one fixed section.
- A one-letter word is ℙ¹, with dimension 1 and two fixed sections.
- The word ii has dimension 2 and four fixed sections; deleting a repeated letter would incorrectly reduce these to 1 and 2.

*Needs:* S2.1 and the split pinned model of S1; scheme gluing and descent. The contracted-product definition and tower are LLM §1.4, pp. 300–301; the integral extension uses the same quotient charts.

### 2.3 Subwords and images

Construct subword closed embeddings, the 2^r T-fixed sections and the image of each indexed subword. For ε∈{0,1}^r put w_j=s_i₁^(ε₁)⋯s_ij^(ε_j). Prove tangent weights β_j=(−1)^(ε_j)w_(j−1)α_ij from the actual successive rank-one charts; the fibre of π*Lλ has weight w_rλ. For reduced words, identify the open product of root parameters with C(w) and prove π proper birational onto X(w), isomorphic on that open cell. Prove the subword/Bruhat criterion from the existing Coxeter exchange/deletion floor and these actual maps; do not infer an isomorphism from a mere bijection of fixed points. A proper fibre can be nonreduced even when its underlying set is one point.
   **Images for every word.** For Q=(i₁,…,i_r), define δ(Q) by δ(∅)=e
   and δ(Qi)=max(δ(Q),δ(Q)s_i) in the fixed right-word convention. Prove
   that the actual scheme-theoretic image of π_Q is X(δ(Q)), using the
   rank-one cell multiplication and induction, with its reduced closure
   and field/base-change comparison. Do not substitute the ordinary group
   product of the letters. At Q=(i,i), the image is X(s_i), not X(e);
   at the empty word it is the identity flag. Reduced words recover item3.
   Keep the all-word map distinct from a reduced-word birational resolution.

- Subword embeddings set omitted factors to the identity coset and commute with multiplication.
- The Demazure product records the image, and is unchanged by appending a descent.
- Fixed-point tangent and line weights retain the same prefix products w_j as multiplication.

**Checks.**

- For Q empty, δ(Q)=e and the image has dimension 0.
- For Q=i, the two tangent weights are α_i and −α_i; the line fibres are λ and s_iλ.
- For Q=ii, δ(Q)=s_i and the image dimension is 1, while the ordinary product is e of length 0; the four fixed sections map to e,s_i,s_i,e.

*Needs:* S2.2; RootSystems Layers 1–3 exchange/deletion and Bruhat order; S5.6 for the actual reduced closures and their base change. The reduced-word charts are the route to the subword comparison.

### 2.4 Parabolic words and refinements

Construct generalized words with parabolic letters and their longest elements, refinement/unrefinement maps and composites. Prove the needed reduced-word comparisons by finite zigzags of refinements and unrefinements from actual Coxeter braid/length data. Ordinary reduced words121 and212 have no further simple-letter refinements, so no single common word refinement is assumed. The resulting diagrams/correspondences are over the flag; a braid move is not asserted to give an isomorphism of the two word schemes. A parabolic longest element reverses the positive subsystem; it need not fix the other simple roots or negate every simple root individually. Give rank-two braid and nonreduced examples.

- Refinement multiplies the factors inside the specified parabolic letter.
- Unrefinement respects the final flag and composes with further unrefinements.
- The comparison zigzags preserve the multiplication morphisms, without identifying the intermediate schemes.

**Checks.**

- Refining the empty word does nothing: the result remains a point.
- In A₂, 121 and 212 both represent w₀ of length 3; each has zero further simple-letter refinements.
- In the A₂ parabolic on both roots, w₀ sends α₁ to −α₂, not −α₁; replacing subsystem opposition by individual negation is incorrect.

*Needs:* S2.1–2.3; ReductiveGroups parabolics and RootSystems finite Coxeter braid and length theory.

### 2.5 Compact word comparison

Compare the complex scheme with the compact model using the actual rank-one group T·SU₂α and its finite central quotient, not an unconditional product SU₂×T^(rank−1). Consume the compact rank-one root representatives from LieGroups. Export full groupoid/functorial chart, bundle and projection comparisons, then compare the typeA finite characteristic maps with TopK's existing normalization. Generic word geometry here does not become an extra premise for TopK's finite CW construction.

- The comparison identifies quotient charts and their transition maps.
- It commutes with the tower projections and multiplication to the flag.
- The finite central kernel is retained when comparing the compact rank-one factors.

**Checks.**

- The empty complex word and compact word are both a point.
- A one-letter complex word is ℙ¹ and its compact model is SU₂/U₁≃S².
- The map SU₂×U₁→U₂ has kernel {(I,1),(−I,−1)} of size 2; treating it as a direct-product isomorphism would give kernel size 1.

*Needs:* S2.2; LieGroups Layer 8 and S9.0–9.1 for the complex realization; TopologicalKTheory T1.5 for the type-A characteristic maps.

### Examples

The empty word has dimension 0 and one fixed section. One simple reflection gives ℙ¹ with two fixed sections of tangent weights α and −α. The word ii has dimension 2 and four fixed sections but image of dimension 1, so its image map is not birational.

### Dependencies

S1.0–2 and ReductiveGroups Layers 7–9 for rank-one parabolics; scheme fibre products and associated-bundle descent.

## Layer 3: Line bundles, sections and rank-one push-pull (S3)


### 3.1 Associated lines and their fibres

Construct L(λ) on the supplied quotient by descent, with its actual linearization, local transition functions and sections. Prove tensor L(λ+μ), dual, pullback, associated-bundle and field/base-change laws. Characterize descent to P− by the Levi pairings and its actual group characters. Prove ampleness for strict positivity on the complementary simple roots and global generation for dominance; a character not in the original lattice is handled only after the specified cover/flag comparison.
   **Equivariant lines and the fibre inverse.** Over the stated field k,
   construct the equivalence between the groupoid of G-linearized invertible
   sheaves on G/B− (with G-equivariant isomorphisms) and the groupoid of
   one-dimensional rational B−-modules (with B−-linear isomorphisms).
   The fibre functor takes E to E_(eB−), with its actual stabilizer action;
   its inverse is the associated-line construction above. Construct the unit
   v↦[1,v] and the counit [g,v]↦g·v, proving independence of the quotient
   representative, regularity and both inverse and triangle identities by
   descent on the supplied quotient charts. Prove full faithfulness on the
   actual isomorphism spaces, naturality, and compatibility with tensor,
   dual, the trivial line and field extension. This is the homogeneous
   application of the existing associated-bundle/descent machinery, with
   its actual G action; it does not replace that machinery.

   Prove that every algebraic character of B− is trivial on its unipotent
   radical and factors uniquely through T. Thus isomorphism classes of
   these specified G-linearized lines are X*(B−)≃X*(T), with fibre character
   λ for L(λ); retain the scalar automorphisms in the groupoid rather than
   replacing it by a discrete category of weights. A Lie functional in t*
   is not a group character without the actual lattice/integration condition.
   Give the same fibre/associated-line equivalence for G/P− and rational
   characters of P−, and compare restriction to T with precisely the zero
   Levi-coroot-pairing condition already specified above.

   Construct the forgetful map to the ordinary Picard group and its tensor
   laws. Prove that two G-linearizations on the same underlying line differ
   by a unique character of G: use H⁰(G/P−,O)=k and the linearization cocycle
   to identify their fibrewise ratio, and prove its regular dependence on G.
   In particular identify the kernel of forgetting with the restrictions
   of X*(G) inside X*(P−). Do not assert that every ordinary line admits a
   G-linearization. For a root-free torus the flag is a point, so all its
   characters give the same underlying ordinary line with different
   linearizations; the zero character gives the equivariantly trivial line.

- The fibre and associated-line maps are inverse on equivariant isomorphisms, not only on isomorphism classes.
- Tensor adds characters; duality negates them; restriction preserves the fibre at the identity.
- Forgetting equivariance kills precisely the characters extending to G.

**Checks.**

- On SL₂/B− the weight-one line has degree +1; reversing the character would give −1.
- On a torus flag, characters 0 and 1 give the same underlying one-dimensional line and different torus actions.
- A GL₂ determinant character restricts to degree 0 on the flag, while the weight-one SL₂ character has degree 1.

*Needs:* S1's quotient charts; ReductiveGroups rational characters and descent; AlgebraicVectorBundles line, tensor and dual sheaves. The rank-one sign agrees with BrionFlags §1.4 after opposition; the fibre equivalence follows from quotient descent.

### 3.2 Sections and extremal spans

Construct the regular-function realization ∇λ from the rational representation supplier and the natural section map. Prove its inverse on quotient charts. On the full flag and dominant λ, compare it with the canonical Weyl/induced pair. On X(w), define sections geometrically and identify the dual of restriction with the actual B−-span in Δ(κ), κ=−w₀λ, generated by the extremal vector of weight−wλ. Prove this comparison using the normalized pairing and the actual section-extension theorem of S5. For λ ample on G/P_λ, prove that inclusion of the corresponding geometric Schubert varieties is equivalent to inclusion of these actual extremal-span modules, using the extremal-weight/subword criterion. On walls compare the correct cosets in W/W_λ; a line contracted by the parabolic projection cannot detect distinct full-flag indices. Convert to positive-Borel Demazure modules using pinned contravariant duality/opposition; ordinary dualization alone changes λ.

*Needs:* S3.1; ReductiveGroups' induction, extremal vectors and contravariant duality; S5.5 for section extension. The extremal-span comparison uses restriction and the normalized pairing, not a dimension identification.

### 3.3 Integral signed-string operators

For every integer m, specialize SchemeAndStackFoundations §2.6's projective-space cohomology to H⁰/H¹(P¹,O(m)), and construct its actual rank-one T-weight, functoriality, residue/Serre pairing and zero-case comparisons. Build the relative P¹ pushforward and higher-direct-image comparison on the actual rank-one bundle. Define the integral Demazure Euler operator by finite signed root strings. For dominant string length m=⟨λ,α_i∨⟩≥0 it gives Σ_(j=0)^m e^(λ−jα_i); for m=−1 it is0, and for m≤−2 use the negative H¹ string. Prove its localization identity D_i(eλ)=(eλ−e^(−α_i)e^(s_iλ))/(1−e^(−α_i)).
   **Positive-denominator convention.** Also construct the source operator
   Δ_i(p)=(p−e^(α_i)s_i(p))/(1−e^(α_i)) on the integral group ring of the
   actual character lattice. With weight inversion ι(eλ)=e^(−λ), prove
   Δ_i=ιD_iι. Define it integrally before localization: for
   m=⟨λ,α_i∨⟩, it sends eλ to Σ_(j=0)^(−m)e^(λ+jα_i) when m≤0,
   to0 when m=1, and to −Σ_(j=1)^(m−1)e^(λ−jα_i) when m≥2.
   Prove these finite strings give the displayed rational identity and
   independence of a presentation. In particular they prove divisibility
   over ℤ without an analytic removable-pole argument. For
   N=p−e^(α_i)s_i(p), the exact identity is s_i(N)=−e^(−α_i)N,
   rather than unweighted antisymmetry. Deduce s_iΔ_i(p)=Δ_i(p),
   Δ_i²=Δ_i and the braid comparisons by the actual inversion conjugacy.

   Compare the source's positive-Borel/left-crank convention with the
   current negative-Borel/right-word one through S1's inversion and S3's
   associated-line/opposition maps. In particular left multiplication
   s_iw becomes w⁻¹s_i after inverting the Weyl index; retain the actual
   character inversion and longest-representative fibre factors as well.
   For the source's left-crank map, compute the two base fixed fibres with
   their actual bundle lift, obtaining Δ_i. Use S5's cohomological comparison
   to pass from Euler character to H⁰ in the dominant case. If the next
   Demazure product is unchanged, the same comparison proves that Δ_i fixes
   the corresponding character; at the longest word each simple operator
   fixes the result, hence it is Weyl invariant. The character formula and
   its exercises use these maps, not a guessed sign or an assumed equality
   of the two Borel conventions. This late geometric comparison is not a
   prerequisite for the separate early Laurent/Haar proof of the formula.

   The signed-string operator's API is ℤ-linearity, the finite-string
   formula, the localization identity and inversion conjugacy with Δ_i.

   **Checks.**

   - For pairing m=0, D_i(eλ)=eλ, with augmentation 1.
   - For m=−1, D_i(eλ)=0; retaining either endpoint would give augmentation 1.
   - For m=−2, D_i(eλ)=−e^(λ+α_i), with augmentation −1;
     replacing Euler cohomology by H⁰ would incorrectly give 0.

   *Needs:* SchemeAndStackFoundations §2.6's projective-line cohomology;
   S1's rank-one quotient; S3.1's line convention; the group ring of the
   actual character lattice. The finite-string algebra is independent of S5;
   only the geometric H⁰ interpretation needs S5's vanishing.


### 3.4 Demazure and Weyl characters

Prove D_i²=D_i, the finite braid relations and word-independence for the required push-pull operators, keeping Euler classes distinct from individual H⁰ outside the vanishing range. For dominant λ, S5 supplies the actual no-higher-cohomology/pullback comparison needed to identify char H⁰(X(w),Lλ)=D_i₁…D_ir(eλ). Prove wall/Levi and longest-word cases, including the full Weyl character formula at characteristic0 and the induced/Weyl formal character in characteristicp. Do not replace a positive-characteristic induced module by a simple module.

*Needs:* S3.3 for signed strings; RootSystems finite braid theory; S5.5 and S5.7 for the dominant geometric interpretation. LLM Theorem 5, p. 299 gives the corresponding iterated character formula; S3.3 transports its convention.

### 3.5 Highest-line embeddings

Construct coordinate maps for the complete linear system and the extremal-line orbit, and prove their scheme-theoretic comparison. Basepoint freeness and injectivity on geometric points do not prove a closed immersion in characteristicp. Own the exact stabilizer/separability and closed-immersion argument for the chosen canonical model; for a general highest-weight representation state the actual stabilizer conditions. Test the SL₂ Frobenius representation, where the orbit map can be purely inseparable.

- Evaluation is equivariant and descends to the stated quotient with its scheme stabilizer.
- Its line pullback is the specified L(λ), including its linearization.
- The closed-immersion conclusion requires the full stabilizer scheme, not only its geometric points.

**Checks.**

- SL₂ with L(1) gives the identity embedding of ℙ¹, with differential rank 1.
- With λ=0 the map has point image and differential rank 0; it is not an embedding of ℙ¹.
- In characteristic p the Frobenius-twisted natural representation gives [x:y]↦[x^p:y^p], with differential 0 although the geometric point map is bijective.

*Needs:* S3.1–3.2; S3.1's global generation and the scheme closed-immersion criterion; ReductiveGroups scheme stabilizers.

### 3.6 A₂ signed-string character calculation

The diagram in KnutsonDemazure §4.0.2, p. 4 motivates this worked test.
The coefficient formula below is a deduction from S3.3’s finite signed strings
and the displayed interlacing inequalities, not a transcription of that diagram.
As a worked test of the integral operators and the geometric comparison,
compute the dominant SL₃ weight λ=2ω₁+5ω₂ using both reduced words121
and212. Fix α₁=ε₁−ε₂ and α₂=ε₂−ε₃. Use the GL₃ lift (7,5,0),
whose restriction has this SL₃ highest weight, and write e^(a,b,c) for its
weight monomials. All weights have a+b+c=12; this slice gives distinct
representatives modulo the diagonal SL₃ character relation. Start at the
lowest monomial χ₀=e^(0,5,7) and use S3.3's positive-denominator Δ_i.

Prove the two first stages explicitly:

`χ₁=Δ₁χ₀=Σ_(j=0)^5 e^(j,5−j,7)`,

`χ₂=Δ₂χ₁=Σ_(j=0)^5 Σ_(k=0)^(j+2) e^(j,5−j+k,7−k)`.

Their augmentations are6 and33, and every displayed weight has
multiplicity1. Collect the signed strings of χ₃=Δ₁χ₂: its coefficient
at (a,b,c) is zero unless a+b+c=12 and 0≤a,b,c≤7; on that support it is

`1+min{2,a,b,c,7−a,7−b,7−c}`.

Thus there are46 weights:21 of multiplicity1,15 of multiplicity2 and10
of multiplicity3, giving dimension81. In particular the zero SL₃ weight,
represented by (4,4,4), has multiplicity3. Compare this actual group-ring
character with the Weyl and induced formal characters of highest weight λ
from the rational-representation supplier; identify the geometric section
modules through S3.3's explicit inversion/opposition maps. Independently
compare the typeA Gelfand–Tsetlin character: enumerate interlacing rows
`7≥u≥5≥v≥0`, `u≥w≥v`, of weight
`(w,u+v−w,12−u−v)`, and prove their multiplicities equal the formula above.
This is a coefficientwise comparison, not just equality of dimensions.

For the other word, set ψ₁=Δ₂χ₀, ψ₂=Δ₁ψ₁ and ψ₃=Δ₂ψ₂.
Prove the stage dimensions1,3,21,81 and ψ₃=χ₃; also prove
Δ₁χ₃=Δ₂χ₃=χ₃ and Weyl invariance on this actual character. At each step
retain the numerator identity
`(1−e^α_i)Δ_iχ=χ−e^α_i s_iχ` and its finite divisibility witness.
Negative coefficients in the flipped/shifted numerator are allowed; the
resulting Demazure characters have nonnegative coefficients. These are
explicit tests of signed-string cancellation, braid order and the
source-convention comparison, rather than an additional character engine.

**Checks.**

- The word 121 has successive augmentations 1,6,33,81; the word 212 gives 1,3,21,81.
- The final coefficient histogram is 21,15,10 weights of multiplicities 1,2,3, respectively, totaling 46 weights and dimension 81.
- The central weight (4,4,4) has multiplicity 3, whereas (9,3,0) has multiplicity 0; extending the coefficient formula outside its support gives a wrong value.

*Needs:* S3.3–3.4 for signed strings and characters; the type-A weight lattice from RootSystems. The displayed interlacing inequalities give an independent finite count.

### Examples

On ℙ¹ the rank-one Euler dimensions for m=0, −1, −2 are 1, 0, −1. For the A₂ weight 2ω₁+5ω₂, both word orders give dimension 81 with 46 weights, as calculated above.

### Dependencies

S1–S2; SchemeAndStackFoundations §2.6; the named rational-representation supplier. Dominant geometric section characters additionally use S5.

## Layer 4: Finite-type LS chains, root operators and section indices (S4)


### 4.1 Paths and crystals

On a fixed finite root datum build the normal path-crystal category using actual partial maps e_i,f_i:B→Option B, weight, ε_i and φ_i, their partial-inverse/weight/string identities, strict morphisms, components, tensor products with stated tie convention, and transport through actual isomorphisms. The paths below supply the objects; no classification of arbitrary abstract edge-labelled graphs is assumed from rank-one identities alone. For the actual finite root datum construct rational PL paths in X⊗ℝ starting at0 with integral endpoint, their finite rational presentations, equivalence under nondecreasing surjective PL reparametrizations, concatenation, reversal, and equality/normalization APIs. On parametrized representatives define addition of the linear central path t↦tχ for χ annihilating every coroot (equivalently W-fixed); this formula is not an operation on arbitrary reparametrization classes. S4.3 constructs the well-defined central transport on distinguished LS representatives. Remove stationary pieces and merge adjacent positively collinear segments before choosing a rational PL presentation. Prove existence of rational normalized presentations and equivalence by common rational subdivisions, with presentation-independent comparison maps; Euclidean arc lengths need not be rational. The constant path is separate. For an LS path retain its distinguished constant-speed-on-directions presentation with slopes in Wλ and prove uniqueness up to the admitted reparametrizations, including the central/zero-weight cases. Neither all rational paths nor all integral-endpoint paths form a finite crystal.
   For the path carrier, the API consists of presentation equivalence,
   reparametrization-invariant endpoints and concatenation, and comparison by
   common rational subdivisions. For the crystal, the API consists of partial
   inverse root maps, weight changes, finite string lengths and strict morphisms.

   **Checks for rational paths.**

   - The constant path has endpoint 0 and no nonzero segment; normalization
     must not divide by its total segment length 0.
   - The straight GL₂ path (t,0) and its subdivision at t=1/2 give the same
     class and endpoint (1,0); treating presentations as paths would distinguish them.
   - For the reparametrization in the worked examples, phi(1/2)=1/4:
     the shifted point (3/4,1/2) has x−2y=−1/4, while the canonical
     shifted point (1,1/2) has x−2y=0.

   **Checks for crystals.**

   - The zero-weight one-point component has no raising or lowering edges
     and both string lengths 0; a loop would violate the weight change.
   - In the SL₂ highest-weight-one string the two weights are 1 and −1:
     lowering takes the first to the second, and raising reverses it.
   - At the lower endpoint the raising string has length 1 and the lowering
     string length 0; exchanging the two lengths gives the wrong endpoint.

   *Needs:* RootSystems Layers 1–3's Weyl/Coxeter theory and Layer 6's integral root data; Mathlib finite lists and rational arithmetic. The path definitions follow Littelmann1995, §1.


### 4.2 Root operators

Define running coroot heights H_i(t)=⟨π(t),α_i∨⟩ and the actual raising/lowering operators using record-decreasing/record-increasing segments, equal-height excursions and the final root translation. State the first/last cut-time and tie conventions. Prove presentation/subdivision/reparametrization independence, partial inverses and endpoint changes ±α_i. Before using simplified whole-interval reflections, prove the needed local-minimum integrality on the relevant LS components. Distinguish ambient rational formulas from the normal integral crystal identities ε_i=−min H_i and φ_i=H_i(1)−min H_i.

- The domain conditions distinguish missing root arrows from zero vectors.
- Changing presentations preserves the path class and endpoint.
- Raising and lowering are partial inverses and change the endpoint by the specified root.

**Checks.**

- The SL₂ straight highest-weight-one path has height t; lowering ends at −1 and raising returns endpoint 1.
- At its lower endpoint the next lowering is undefined, rather than a loop at weight −1.
- A central GL₂ path (t,t) has both simple-coroot height and root-string lengths 0; adding a subdivision does not create a root arrow.

*Needs:* S4.1; RootSystems roots and coroot pairing. The cut-time and excursion construction is Littelmann1995 §1.

### 4.3 LS chains and interval bonds

For dominant λ construct the operator component B(λ) of the straight path. Encode it by decreasing cosets τ₁>⋯>τ_s in W/W_λ and rational breaks0=a₀<a₁<⋯<a_s=1. For each internal break a_j require an a_j-chain: a saturated decreasing Bruhat chain of orbit weights ξ₀=τ_jλ,…,ξ_l=τ_(j+1)λ, ξ_h=s_βh ξ_(h−1), β_h positive, ⟨ξ_(h−1),β_h∨⟩<0 and a_j⟨ξ_(h−1),β_h∨⟩ integral. Prove this condition is equivalent to the generated-path definition, with merged repeated directions and the correct coset Bruhat order. Prove finiteness from finite W and bounded break denominators, operator stability, weight/string formulas and a unique highest path. Include λ=0, chamber walls, nontrivial central characters and empty root systems. For a W-fixed character a∈X, let B(μ)^a have weight wt+a and the same root operators and string data; prove it is a normal crystal. For W-fixed χ,σ∈X, construct a strict crystal isomorphism T(λ,χ;σ):B(λ)^(σ+χ)→B(λ+χ)^σ. Its underlying path function is independent of σ; σ=0 gives central transport from the weight-twisted B(λ). First prove that an LS class has a unique parametrized representative whose slopes lie in Wλ, after equal adjacent directions are merged; λ=0 uses the constant representative. Apply π(t)↦π(t)+tχ to that representative, so each slope becomes wλ+χ=w(λ+χ). Prove the unchanged simple-coroot heights give the same operator cut times and root actions. Prove the strict-map identity T(λ,0;σ)=id, the additive composition law T(λ+χ,ψ;σ)∘T(λ,χ;σ+ψ)=T(λ,χ+ψ;σ), and the inverse formula (T(λ,χ;σ))^−1=T(λ+χ,−χ;σ+χ), for all central χ,ψ,σ. These offsets make each displayed source, intermediate object and target identical as weighted crystals. Include λ+χ=0, pure central weights and the empty root system. Do not apply the same pointwise formula to an arbitrary representative of the ambient path quotient.
   First export the reflection/order test on the actual quotient W/W_λ. For a positive root β and an orbit weight uλ, negative pairing ⟨uλ,β∨⟩ gives s_βu<u, positive pairing gives s_βu>u, and zero pairing gives the same weight and coset. Compare the minimal quotient representatives, not arbitrary W labels for equal weights. A weak inequality does not give a strict comparison on a chamber wall.

   For comparable u≥v in this quotient define the positive cover bond b_λ(x,y)=−⟨xλ,β∨⟩=⟨yλ,β∨⟩ when x>y is a cover and yλ=s_βxλ, β positive. Prove existence and uniqueness of its positive root label and integrality/strict positivity of the bond. For a saturated chain C from u to v, let d(C) be the gcd of its bonds. Construct the chain-independent interval gcd d_λ(u,v), with the empty-chain convention d_λ(u,u)=0. Give its combinatorial proof before S5: construct maximal-chain connectivity by rank-two intermediate replacements in every parabolic Bruhat interval using a reflection/deletion-order shelling or an explicit chain-sorting induction from RootSystems' exchange/deletion API; then prove equality of the two local bond gcds for each actual rank-two interval with two intermediates. Carry the actual conjugated root/coroot labels and λ through the A₁×A₁, A₂, B₂/C₂ and G₂ calculations, including singular quotient cases. Some quotient rank-two intervals have only one intermediate; no alternative chain is assumed there. These connectivity and arithmetic lemmas are construction targets here, not assumed consequences of Matsumoto or of abstract diamond shape. Gcd associativity then propagates local equality along the chain moves. Extend the same edge-integrality definition of a saturated a-chain to every rational a; actual internal LS breaks still require 0<a<1. For a=p/q in lowest terms with q>0, prove that one saturated a-chain exists iff q divides d_λ(u,v) iff every saturated chain from u to v is an a-chain. Use the native finite-gcd divisibility API and coprime denominator cancellation. Incomparable endpoints have no chain and are outside this comparable-interval gcd API. Keep actual coroots in nonsimply-laced types. Central translation leaves stabilizers and bonds unchanged; zero/pure-central weights and empty root systems give a singleton quotient. This proof uses no Schubert divisor, vanishing or SMT premise. S7 subsequently compares the already-defined bonds with its geometric multiplicities.

   Prove the convexity API for the distinguished LS representative: π(t)∈t·Conv(Wλ), or equivalently π(t)/t∈Conv(Wλ) for 0<t≤1; at t=0 prove π(0)=0 directly. Write π(t) as the finite sum of its elapsed nonnegative segment durations times slopes in Wλ, with total duration t, and apply the native `Convex.sum_mem`, `subset_convexHull` and `convex_convexHull` APIs to the normalized durations. If 0∈Conv(Wλ), deduce π(t)∈Conv(Wλ); in semisimple finite type establish this premise by averaging the orbit. A nonzero pure central λ has orbit {λ} and π(t)=tλ, so the unscaled containment is not asserted for an arbitrary reductive weight. This parametrized formula concerns the distinguished representative; the unparametrized path image has the corresponding representative-independent containment when its premise holds.

- Cover bonds use actual coroot pairings and are invariant under central translation.
- On comparable endpoints, interval gcd divisibility is equivalent to the saturated a-chain condition.
- LS concatenations and central transport preserve the distinguished-representative convention.

**Checks.**

- A rank-one cover at highest weight 2 has bond 2; a=1/2 is allowed and a=1/3 is not, since 2·(1/2)=1 and 2·(1/3)=2/3.
- For equal endpoints the bond list is empty and its gcd is 0; every positive denominator divides 0, agreeing with the empty chain.
- For nonzero central λ, at t=1/2 the path equals λ/2, which belongs to (1/2)Conv{λ} and not to {λ}.

*Needs:* S4.1–4.2; RootSystems quotient Bruhat order and coroots; Mathlib finite gcd and convex-hull APIs. CFL Definition 2.1 and §7.1 give the bond condition; the earlier combinatorial chain-connectivity proof remains a target here.

### 4.4 Characters and tensor components

Construct the generic finite-type character/component theorem, not just its typeA specialization. Prove the root-operator word-distance bound, linked-path subdivision/gluing lemmas and positive-integer stretching required to compare arbitrary dominant rational PL paths of endpoint λ with the straight component. Prove the tensor-component theorem and translated-chamber multiplicity rule, including the actual tensor-factor convention. Derive the formal Weyl/Demazure characters from these finite sets and the rational representation supplier. In characteristic0 compare with simple rational modules; in characteristicp compare the formal Weyl/induced characters, which need not be the simple L(λ) characters; a crystal graph indexes weights and partial root operators, without asserting that actual Lie generators are single-target on a weight basis. The adjoint SL₃ example distinguishes simple generators from all root operators.

   **Checks for the adjoint comparison.** Work in characteristic zero and
   use the six matrix units E_ab, a≠b, with H₁=E₁₁−E₂₂ and
   H₂=E₂₂−E₃₃. The bracket formula
   [E_ab,E_cd]=δ_bc E_ad−δ_da E_cb gives the following controls.

   - The simple pair gives [E₁₂,E₂₁]=H₁, whereas the nonsimple pair
     gives [E₁₃,E₃₁]=H₁+H₂. The second image is not a multiple of H₁ or H₂.
   - Each of the four simple generators E₁₂,E₂₃,E₂₁,E₃₂ sends every
     member of this eight-element basis to zero or a multiple of one member:
     for example [E₁₂,H₁]=−2E₁₂ and [E₁₂,H₂]=E₁₂. Thus this adjoint
     example is not an obstruction to single-target simple-generator actions.
   - Requiring all root actions forces the three Cartan lines kH₁, kH₂,
     k(H₁+H₂). Their coordinate determinants in the basis (H₁,H₂) are
     1,1,−1; a two-dimensional weight space cannot contain three basis lines.
     The one-dimensional root spaces force these lines for any weight basis.

   *Needs:* RootSystems' finite root datum; ReductiveGroups' rational
   representations and their formal characters; S4.1–3's path operators;
   Mathlib matrix multiplication for the displayed bracket calculation.
   The character/component route is Littelmann1995, Theorems 7.1 and 9.1
   and §10; the matrix controls are direct deductions from the bracket formula.


### 4.5 Chain simplices

Construct fixed-chain simplices and their face identifications after equal adjacent directions are merged. The finite LS set is the subset satisfying the break-chain integrality conditions; it is not the whole continuum of a simplex. Give the six-vertex S₃ Bruhat-chain complex and its four maximal tetrahedra, distinguishing this realization from the fixed-λ finite path set. The type-A root-datum specialization is S9.5, after the generic construction. No concrete tableau theorem is a premise of this generic component theorem.

- Removing a repeated direction gives the same face point.
- Common faces glue through their identical direction and duration data.
- The finite LS subset is selected by the integral break conditions, not by all real points of the simplex.

**Checks.**

- A one-vertex chain gives a point, not an interval.
- For the S₃ Bruhat poset there are six vertices and four maximal saturated chains from e to w₀, hence four maximal tetrahedra.
- For a rank-one bond 2, the only internal LS break is 1/2; the simplex also contains 1/3, which fails the integral break test.

*Needs:* S4.3 and RootSystems finite Bruhat order. The simplex realization is the barycentric-duration construction on these chains.

### 4.6 Geometric path sections

After S5 and the divisor calculation S7.1–2, construct geometric path sections in all tensor degrees and their defining-chain API. Use the Schubert poset, extremal sections and the actual codimension-one valuations with Chevalley bonds to build the chain-indexed LS lattice/filtration. Prove the normalized leaves are one-dimensional and identify their indices and character count with S4.1–5. Construct sections lifting those leaves and prove triangular spanning/independence, reduced-word compatibility, weight and restriction support. This is the geometric finite-flag filtration application, not an assumed generic quantum Frobenius/canonical-basis theorem. If a distribution/contraction model is also used for a comparison, prove its exact integral/denominator and specialization maps separately; it is not needed as an unstated premise of this geometric construction.

- Filtration indices retain the extremal weight and the common defining chain.
- Multiplication adds tensor degrees and respects the filtration.
- Restriction retains precisely the indices supported on the indicated Schubert family.

**Checks.**

- For SL₂ with L(1), degree 0 has basis 1 and degree 1 has two sections.
- Degree 2 has three monomials x²,xy,y², rather than the four elements of an ordered tensor-square basis.
- Restricting these degree-two sections to [1:0] keeps x² and kills xy,y², with image dimension 1.

*Needs:* S4.1–4.5; S5.5–5.6; S7.1–7.2. LLM Theorems 4 and 6, pp. 299 and 301 supply the standard-monomial and geometric comparison, with the conventions of S4.7.

### 4.7 Opposition and section weights

Print the opposition/dual dictionary. Set κ=−w₀λ and θ(w)=w₀ww₀. Conjugating G/B− to G/B+ by the chosen longest representative sends X(w) to the positive-Borel X(θ(w)) and pulls the positive-Borel line with fibre−κ back to L(λ), with the actual linearization comparison. In the positive-Borel convention, LS path sections indexed by π∈B(κ) have weight−π(1) and survive on X(θ(w)) exactly when their initial direction is≤θ(w). Transporting gives weight−w₀π(1) on the chosen X(w). For partial flags use the actual minimal-coset projection W/W_P→W/W_λ before making this comparison; do not compare indices in different stabilizer quotients as though they were equal. Prove the terminal-direction formulation in the notebooks by explicit opposition/reversal, rather than equating their untransported symbols w. The point and longest-word tests must recover the single fibre λ and the full ∇λ.

*Needs:* S4.6; S1.0's inversion and ReductiveGroups opposition/contravariant duality; S3.1–3.2's fibre character and ordinary-dual comparison.

### Examples

For λ=0 the LS component is a singleton with weight 0. A pure central λ has π(t)=tλ: at t=1/2 it lies in (1/2)Conv{λ}, but not in {λ} when λ≠0. In the adjoint example, the simple bracket [E₁₂,E₂₁]=H₁ is single-target, but [E₁₃,E₃₁]=H₁+H₂ is not single-target in the displayed basis.

### Dependencies

RootSystems Layers 1–3 and 6; ReductiveGroups rational representations. The path proof route is Littelmann1995, §1, Theorems 7.1 and 9.1, and §10. S4.6–7 additionally use S5 and S7.1–2.

## Layer 5: Splitting, normality, restriction and cohomology (S5)


### 5.1 Frobenius modules and trace

In characteristicp>0 construct the actual Frobenius module F_*O and O-linear Cartier trace on smooth root-coordinate charts. Identify Hom_O(F_*O,O) with F_*(ω^(1−p)) using the specified duality/pullback convention. On affine coordinates the normalized trace selects exponents congruent to p−1 modulo p; it is p^−1-linear over a perfect field and sends the chosen normalized anticanonical section to1. Prove independence under changes of root charts and line trivializations. Construct the section from the algebraic Steinberg module and its normalized extremal pairing before using geometric vanishing or SMT.

The Frobenius module has scalar action a·F_*b=F_*(a^p b). On a polynomial chart with volume form dx₁∧⋯∧dx_n, the raw trace sends x^a to zero unless each a_i≡p−1 modulo p, and then to x^((a−(p−1))/p), taking the pth root of its coefficient. The splitting defined by a local section s is f↦Tr(sf); it is normalized by Tr(s)=1.

- The trace is O-linear for this Frobenius scalar action.
- Volume-form changes transform s as a section of ω^(1−p).
- The normalized splitting retracts O→F_*O and glues by those transitions.

**Checks.**

- In characteristic 2 on k[x], Tr(1)=0, Tr(x)=1 and Tr(x³)=x.
- With s=x, σ(F_*1)=1 and σ(F_*(x²))=x; demanding ordinary k[x]-linearity on the underlying polynomial ring would instead give x².
- For n=0 over a perfect field, Tr(c)=c^(1/p); in particular Tr(1)=1. The zero map fails normalization.

*Needs:* S1's smooth root charts; SchemeAndStackFoundations coherent duality; ReductiveGroups' independent Steinberg representation and extremal pairing.

### 5.2 Compatible ideals

Prove the resulting splitting is compatible with every standard and opposite Schubert ideal by actual B-canonical/rank-one root-subgroup calculations and word induction. For an ideal I the required statement is σ(F_*I)⊂I, not just reducedness of its zero set. Prove closure under finite sums/intersections of compatible ideals, then conclude scheme-theoretic intersections and reduced unions in this family are reduced in positive characteristic. Item6 constructs their characteristic-zero mixed-family comparison. The rank-one, point, empty and whole-flag ideals are explicit tests. Do not infer arbitrary Richardson transversality from this reducedness statement.

- Compatibility means preservation of the ideal as a subsheaf of F_*O.
- Finite sums and intersections of compatible ideals remain compatible.
- The induced quotient splitting forces a compatible closed subscheme to be reduced.

**Checks.**

- For σ(f)=Tr(xf) in characteristic 2, the ideals 0, (x) and (1) are preserved.
- The ideal (x²) is not preserved: σ(x²)=x lies outside (x²); its nonreduced quotient cannot be split.
- On ℙ¹ the standard and opposite closed points form {0,∞}; its structure ring is k×k, of dimension 2, not k.

*Needs:* S5.1; S2's rank-one induction; ideal-sheaf sums and intersections from SchemeAndStackFoundations Layer 1.

### 5.3 Central-isogeny descent

Carry out the construction on the derived simply connected cover, where ρ and the Steinberg weight exist in the actual character lattice. Prove the induced map of flags is an fpqc quotient isomorphism and transport the splitting/ideal identities, even when the central kernel is nonreduced. No étale-cover or differential-isomorphism assumption is substituted for that quotient argument. Keep actual line linearizations when passing between isogeny types.

*Needs:* ReductiveGroups central isogenies and fpqc quotients; S5.1–5.2. For SL₂→PGL₂ in characteristic 2 the central kernel is μ₂ with ring k[u]/((u−1)²), so the flag comparison must not use an étale-kernel argument.

### 5.4 Normality and structure-sheaf pushforward

Prove normality of each Schubert variety. Construct geometrically connected fibres of the reduced-word map by the actual rank-one gallery/partial-flag induction, with the closed fibre pieces and their intersections; do not infer connectedness merely from a fixed-point count. Apply proper Stein factorization and finite normalization to prove geometric unibranchness. In characteristicp prove the needed weak-normality consequence of Frobenius purity: principal ideals are Frobenius closed, and a finite universal-homeomorphic normalization in the total fraction ring must equal the original ring. Combine this with the constructed unibranchness; splitting alone is not a normality theorem. Item6 constructs the corresponding characteristic-zero/integral comparison from the actual identified integral fibres, before using the characteristic-zero conclusions of this paragraph. Once X(w) is normal, prove π_*O_Z=O_X(w) by the actual proper birational/Stein comparison. Reduced unions need not be normal; retain their actual ideal exact sequences.

*Needs:* S2 reduced-word maps; S5.1–5.2; SchemeAndStackFoundations normalization and Stein factorization; S5.6 for characteristic-zero comparison. BrionFlags Theorems 2.1.1 and 2.2.3 give the complex case, not a positive-characteristic proof.

### 5.5 Dominant vanishing and restrictions

In positive characteristic, for dominant λ first prove H^q(Z,π*Lλ)=0 for q>0 by the actual rank-one/word splitting calculation: construct a stable splitting along a boundary-supported ample divisor, prove the required iterated splitting and tensor/pushforward maps, and combine it with nefness and Serre vanishing. Construct the ample combination with positive coefficients on every word-boundary component from the iterated projective bundles; compatibility with the reduced boundary alone is not sufficient. Deduce R^qπ_*O_Z=0 for q>0 by twisting with all sufficiently high powers of an ample line on X(w), using projection formula, coherent Leray and Serre to detect the vanishing direct-image sheaves. This deduction does not use the same direct-image theorem as its premise. Then prove H^q(X(w),Lλ)=0, restriction surjectivity from the full flag, and the same statements for finite reduced unions of Schubert varieties for one fixed Borel (or for their common opposite-Borel transforms). Compare H⁰ on X(w) and Z using the already proved π_*O statement. For ample λ use Frobenius iteration and Serre vanishing with the actual ideal sequence. For merely nef/dominant λ, including0, prove the needed parabolic projection/fibre O-cohomology and pullback comparison; ampleness is not silently assumed. Include empty unions, H⁰(point,L)=its fibre and H⁰(O_Y)=k for a nonempty common-Borel Schubert union Y. Mixed standard/opposite compatible unions retain S5.2's ideal and reducedness conclusions, but their section comparison uses the actual ideal/cohomology exact sequence and proved vanishing hypotheses. It does not assert dominant restriction surjectivity or a common-Borel path basis for every mixed union: in P¹, Y={0,∞} and λ=0 give H⁰(O_Y)=k² and the diagonal restriction k→k², with H¹(I_Y)=k.

*Needs:* S5.1–5.4; S2's iterated projective bundles; SchemeAndStackFoundations §2.2 and §2.6 coherent pushforward, Serre vanishing and projective cohomology. LLM Theorem 6, p. 301 supplies the word vanishing comparison; the mixed-union counterexample retains the separate ideal exact sequence.

### 5.6 Integral coherent comparisons

Construct the integral Schubert closure and base-change comparison here. Start with S1.0’s smooth projective integral full flag F/ℤ and each smooth iterated-P¹ word model Z/ℤ of S2, their multiplication map π:Z→F and the open root-cell isomorphism; the schematic Schubert closure is not yet assumed to commute with base change. Choose λ in the actual character lattice strictly positive off the chosen parabolic, so Lλ is ample on that flag, and set A_m=H⁰(Z,π*Lλ^(⊗m)), m≥0. First prove the characteristic-p vanishing of these actual nef pullback bundles for every m≥0 by item5's stable ample-divisor splitting construction, not by splitting alone. Do the same on F. Construct derived cohomology/base-change on these smooth proper integral sources using their flat bundles, actual coherent complexes and the finite affine Čech comparison. Prove the complexes are perfect over ℤ; the positive-characteristic fibre vanishing and constant Euler ranks then give finite-free H⁰, no higher cohomology, and the required arbitrary-ring base-change maps. This step uses neither flatness nor fibre identification of a putative Schubert closure.

   Construct every restriction map H⁰(F,Lλ^(⊗m))→A_m, including m=0. Their reductions at each prime are surjective by the independently proved characteristic-p Schubert restriction and word direct-image comparisons. The cokernel is a finite ℤ-module; its reduction at every prime is zero, so it is zero. Prove this argument with the actual H⁰ base-change identifications. The resulting graded algebra map is surjective in every degree. Prove finite generation of A via its finite coherent module over the ample section algebra on F, construct Proj A and its closed immersion into F, and compare the morphism from Z given by the pulled-back ample line. Identify its scheme-theoretic image with the schematic root-cell closure using the open-cell isomorphism and the actual homogeneous kernel, not just an equality of geometric point sets. Prove A is normal from the normal integral Z and its invertible sheaf, using the intersection-of-local-valuation or total-line-space argument; hence its Proj is normal. This establishes the characteristic-zero normality needed in item4, as well as the integral fibre/section comparison. Treat partial flags with an actual ample character of their lattice and the specified projection, not an assumed fundamental weight outside that lattice.

   For the mixed standard/opposite comparison, construct its additional homological inputs on these same Schubert and opposite Schubert loci. The word boundary has affine-space complement; prove the stable ample-boundary splitting plus strong F-regularity of that regular affine complement gives global F-regularity. Push the actual Frobenius retractions through the proper word map with π_*O=O to obtain global F-regularity of field Schubert images, and prove their Cohen–Macaulay consequence at the stated F-finite/perfect-field hypotheses. Use the identified flat integral models and the precise openness/spreading comparison to obtain the characteristic-zero Cohen–Macaulay statement. Prove proper standard/opposite intersection and Tor independence in the smooth flag by the actual root-cell dimension and Cohen–Macaulay intersection calculation; construct the corresponding flat integral Richardson model and its fibre ideals before spreading reducedness to characteristic0. Finite compatible mixed unions/intersections require their actual ideal-lattice and exact-sequence/base-change induction. Neither flatness of an intersection nor base change of an arbitrary ideal intersection is assumed for free. These constructions give reducedness/ideal comparisons, not the false all-dominant mixed-union section-surjectivity theorem.

   Export the resulting finite-free section/restriction modules and their arbitrary-base-change maps on these integral Schubert schemes. For common-Borel unions use their actual ideal/section exact sequences and the field restriction/vanishing theorem to construct and compare the integral union; do not normalize a reducible union or infer fibrewise reducedness from saturation alone. Establish the characteristic-zero and arbitrary-field versions of items4–5 on the identified schemes; descend geometric conclusions from perfect algebraic closures by their actual faithfully flat comparison. Transport these coherent comparisons to relative split Schubert bundles by pullback and to twisted forms by descent for specified torsors preserving the Schubert family and its line linearizations. Prove their fibre and cohomology comparisons using the base-change maps just constructed; the smooth-source H⁰ argument uses the independent splitting calculation.

- Pullback identifies the section modules and their restriction maps degree by degree.
- Their finite-free integral models have the same ranks on every field fibre.
- Descent preserves the specified line linearizations and coherent exchange maps.

**Checks.**

- On ℙ¹/ℤ, degrees 0,1,2 give free modules of ranks 1,2,3, unchanged over 𝔽₂ and 𝔽₃.
- For the empty Schubert union, each section module is zero, including degree 0.
- A rank-one open chart over ℤ[ε]/(ε²) retains ε≠0; fibrewise reducedness is not reducedness of the total space.

*Needs:* S1.0 and S2; S5.4–5.5 in positive characteristic; SchemeAndStackFoundations perfect coherent complexes, projection formula and base change; StableReduction Layer 2 relative Proj. The integral section comparison is the smooth-source cohomology argument above.

### 5.7 All-word derived comparison

Construct the all-word coherent comparison with the actual image
   X(δ(Q)) from S2, including nonreduced Q. Use the reduced-word instances
   of items4–6 first; no assertion that π_Q is birational is made. Prove
   O_X→Rπ_Q*O_Z is a quasi-isomorphism, with its actual unit, equivariance,
   field-change and restriction comparisons. Give the rank-one induction:
   for w=δ(Q), factor the next crank through
   Y=X(w)×_(G/P_i−)G/B−. The map Z_(Qi)→Y is the flat base change of
   π_Q along the P¹-bundle Y→X(w), so proper flat base change transports
   its already proved O-direct-image comparison. If ws_i<w, the image
   X(w) is saturated for the rank-one projection; the other map Y→X(w)
   is a P¹-bundle. Construct its unit and higher-O-vanishing by the rank-one
   projective-bundle calculation and descent. If ws_i>w, compare Y with
   the reduced word for w followed by i. Its proper reduced-word resolution
   of X(ws_i) has the item4–6 direct-image comparison, while its map to Y
   has the same flat-base-change comparison. The derived composition and
   Leray maps then give the comparison for Y→X(ws_i). Prove these factor
   and base-change squares on the actual flag/word schemes, rather than
   treating the gallery as an abstract equality of point sets.

   Apply projection formula to any specified line bundle L on the flag
   to construct RΓ(X(δ(Q)),L)≃RΓ(Z_Q,π_Q*L), naturally and equivariantly.
   For dominant λ, items5–6 supply the corresponding higher-cohomology
   vanishing on the image and hence on the word model. This constructs the
   actual H⁰ restriction/pullback isomorphism as well as its higher-degree
   comparison; equality of dimensions or of Euler characters is insufficient.
   The empty word and Q=(i,i) are explicit tests. Before S9's Lefschetz trace
   application, compare the specified torus-linearized bundle and section
   action through this same isomorphism. Generic fixed-map traces remain
   at IndexTheory I8; they are not a premise of this algebraic comparison.

- The derived comparison uses the unit O→Rπ_*O and its composition law.
- Projection formula transports it to every specified invertible sheaf, without a dominance hypothesis.
- Dominance is used only for vanishing, not for the comparison isomorphism.

**Checks.**

- For Q empty, π is the identity of a point, with H⁰=k and higher groups zero.
- For Q=ii, the image is ℙ¹ and π has ℙ¹ fibres; H⁰(O_fibre)=k and H¹(O_fibre)=0 despite dimension 2 of the source.
- For L=O(−2) on this image, H⁰=0 and H¹=k on both sides; replacing derived comparison by dominant vanishing would lose H¹.

*Needs:* S2.3's all-word image; S5.4–5.6; proper flat base change, projection formula and derived composition from SchemeAndStackFoundations Layer 2. The rank-one induction above is a deduction from these inputs.

### Examples

For Y={0,∞} in ℙ¹, H⁰(O_Y)=k² and restriction of constants is the diagonal k→k², so mixed-union surjectivity fails. For ℙ¹ over ℤ and m=0,1,2, H⁰(O(m)) has ranks 1,2,3, unchanged after reduction modulo 2 or 3.

### Dependencies

S1–S3; coherent cohomology, duality, Serre vanishing and Stein factorization from SchemeAndStackFoundations; the independent algebraic Steinberg representation; the integral-model contract specified in S5.6.

## Layer 6: Coordinate rings and all-degree standard monomials (S6)


### 6.1 Section and coordinate algebras

Construct the natural graded map from the homogeneous coordinate algebra of a chosen Plücker/highest-line embedding to ⊕_(m≥0)H⁰(X,L^(⊗m)), with actual multiplication and restriction maps. Keep degree0, reduced unions and all m≥0. Establish its kernel, saturation, surjectivity in every degree and the section/Proj comparison; a projective embedding alone does not identify these two graded rings. For non-ample dominant λ compare with the contracted partial flag image instead of falsely asserting an embedding of the full flag.

- The comparison preserves degree, the unit and multiplication of actual sections.
- Its kernel is the homogeneous ideal of the stated embedding.
- Restriction to a Schubert subscheme commutes with this graded map.

**Checks.**

- For ℙ¹ with O(1), degrees 0,1,2 have dimensions 1,2,3 on both sides.
- For ℙ¹ with O(2), degree 1 has three sections, not two; the grading remembers the polarization.
- With L=O on ℙ¹ the section algebra has dimension 1 in every degree and Proj a point; it cannot recover the full flag as an embedded scheme.

*Needs:* S3.5; S5.5–5.6; StableReduction Layer 2 relative Proj; SchemeAndStackFoundations coherent section multiplication.

### 6.2 Determinant sections in type A

For typeA Grassmannians and flags consume GG's polynomial maximal-minor/flag-minor straightening bases, certified orders and initial algebra. Identify every coordinate minor with the actual determinant universal section and its dual T-weight. Prove the complete homogeneous ideal and geometric Schubert restriction ideal, standard-on-X(w) basis and Schubert-union support criterion. The scheme ideal, section restriction and multigrading are part of this comparison; algebraic pointwise vanishing over a field is not the full relative scheme proof.

*Needs:* GroebnerGeometry G5 polynomial straightening and initial algebra; S1.1 and S6.1 for the universal determinant sections and scheme comparison.

### 6.3 Minuscule induction

Give the source's minuscule induction in full on G/P_λ with its actual ample minuscule polarization; full-flag pullbacks use the already proved parabolic cohomology comparison before any Serre argument. The extremal section divisor is a reduced lower-dimensional Schubert union; multiplication gives 0→O_X(m−1)→O_X(m)→O_D(m)→0. Prove the union intersection ideals are reduced by S5 before using Mayer–Vietoris. Prove both the higher-cohomology descent from actual Serre vanishing and the H¹/restriction/dimension step by the exact maps and standard sections. An unexplained dimension count cannot assume the restriction surjectivity being proved. The m=0 boundary case and all nonnegative twists stay included.

*Needs:* S5.2 and S5.5 for reduced unions and cohomology; S7.1–7.2 for minuscule divisor multiplicity; S6.1 for graded restriction.

### 6.4 Standard products

For arbitrary finite root type and dominant λ use S4's geometric path sections and defining chains. For an ordered tuple of dominant shapes, a standard product is one whose successive path directions admit a common decreasing lift in W with the specified stabilizer quotients; build its canonical minimal/maximal defining-chain tests and equivalence with the path concatenation criterion. Prove spanning by a well-founded triangular straightening and independence by the normalized filtration. Pairwise weak standardness is not substituted for a common defining chain. Export every multidegree, the single-shape Veronese rings, Demazure character and restriction formulas, and a basis on a finite reduced common-Borel Schubert union by sections standard on at least one component.

- Standardness uses one common defining chain for the whole tuple.
- Standard products retain their multidegrees and weights.
- Schubert restriction is a coordinate projection on the supported standard products.

**Checks.**

- The empty product has degree 0 and equals 1 on a nonempty Schubert variety.
- For SL₂, two degree-one factors produce three standard degree-two products, while the tensor square has dimension 4.
- On the closed point of ℙ¹, exactly one of these three products survives, with dimension 1.

*Needs:* S4.6–4.7; S6.1; S5's restrictions. LLM Theorem 4, p. 299 and Theorem 6, p. 301 give the basis and geometric interpretations.

### 6.5 Ideals and normal generation

Give the compatible ideal and multiplication API: for the fixed-Borel Schubert family, basis vectors failing its support test span the vanishing ideal, ideal intersections/sums match its reduced unions/intersections, and restriction maps are coordinate projections in that compatible basis. Mixed standard/opposite intersections keep their actual S5.2 ideal identities; any section basis or surjectivity comparison there requires its own proved restriction/vanishing hypothesis, not this fixed-Borel assertion. For each normal Schubert variety and the full flag, prove projective normality and normal generation in the ample/actual embedding lane using these all-degree maps and integrality, not by defining the section ring to be the coordinate ring. Reduced unions retain their all-degree coordinate/section comparison and normal-generation theorem, but are not asserted normal without an actual normality hypothesis; a reducible union can fail normality along its intersections. For the source's toric degeneration consume GG's Rees/SAGBI comparison and identify the initial algebra; an associated graded toric algebra does not make the original flag algebra toric. General path-based degenerations may be unions of toric components and must keep their actual fan/valuation hypotheses.

*Needs:* S5.2, S5.5–5.6; S6.1–6.4; GroebnerGeometry G5 for the Rees/initial-algebra comparison. Normality is asserted only for the normal Schubert components, not their reducible unions.

### Examples

For Gr(2,4), the six Plücker coordinates satisfy p12*p34−p13*p24+p14*p23=0. Degree 0 has dimension 1 and degree 1 has dimension 6; the toric initial algebra is compared by degeneration, not identified with the original multiplication.

### Dependencies

S1–S5 and S7.1–2 for geometric path sections; GroebnerGeometry G5 for the polynomial minor and straightening theory; the named projective-scheme and coherent suppliers.

## Layer 7: Chevalley divisors and incidence multiplicities (S7)


### 7.1 Divisor valuations

Choose the normalized extremal section nonzero on C(w). For v=w s_β with β>0 and ℓ(v)=ℓ(w)−1, prove that its divisor along X(v) has coefficient ⟨λ,β∨⟩. Show support, valuation at the codimension-one local ring, actual rank-one transverse parameter and compatibility with the chosen left/right quotient and weight. Equivalently express it using the transported extremal weight at v; prove the equality of these formulas rather than guessing the source's β side.

*Needs:* S3.1–3.2; S5.4 for codimension-one valuations; ReductiveGroups root coordinates; S4.3's coroot bonds. BrionFlags Proposition 1.4.5 gives the complex type-A formula; the rank-one local-parameter calculation establishes the stated root-datum form.

### 7.2 Boundary multiplicities

Distinguish the effective Cartier divisor of the full section from individual Schubert boundary Weil divisors, which need not be Cartier. In the minuscule lane all nonzero coefficients are1 and recover the reduced hyperplane/Pieri boundary used in S6. For general λ retain multiplicities in the cycle/class formula and use an actual coherent boundary filtration; do not tensor a fictitious invertible O(−X(v)) for every component. Include zero coefficients, λ=0 and the empty divisor.

*Needs:* S7.1; SchemeAndStackFoundations divisor and cycle classes; S5.2's reduced boundary ideals. For O(m) on ℙ¹ the multiplicity is m, giving 0,1,2 at m=0,1,2 rather than a constant multiplicity 1.

### 7.3 Cycle comparison

Construct the flag-specific Chow-to-integral-cohomology comparison from the generic algebraic cycles/localization/refined-intersection API of SchemeAndStackFoundations §5 and the existing LieGroups flag CW/cohomology carrier. Prove the affine-cell filtration spans the Chow group by Schubert closures, and prove independence using opposite-cycle intersection and degree. Send a Schubert generator to the ambient homology class obtained by pushing the complex-oriented fundamental class of its reduced-word resolution; identify its coefficient1 on the open cell and the corresponding CW generator. Prove the pairing, divisor/Chern class and parabolic projection laws, yielding the flag comparison and its ring compatibility. This is an application-specific construction, not a claim that AVB's proposed general Betti cycle-class programme already exists. Compare the source Chevalley–Pieri degree calculation, including positivity and the actual multiplicities. General singular intersections retain their refined-intersection hypotheses; the transverse complex Grassmannian point-count comparison of TPC remains at its existing owner.

- The cycle map respects proper pushforward and parabolic projection.
- Complex orientation fixes coefficient +1 on each open cell.
- Opposite-cycle intersection identifies the basis and its dual pairing.

**Checks.**

- A point flag has one degree-zero class, mapping to 1 in ℤ.
- On ℙ¹ the hyperplane has degree 1 and square 0 in the cohomology ring; replacing it by the fundamental class reverses degrees.
- On the GL₃ full flag the six classes have complex dimensions 0,1,1,2,2,3 and Euler characteristic 6; this count alone does not establish the cup products.

*Needs:* S7.1–7.2 and S2 reduced-word resolutions; SchemeAndStackFoundations §5; LieGroups Layer 8 and TopologicalKTheory T1.5. BrionFlags §1.3 supplies the complex cycle and opposite-intersection calculation.

### Examples

On ℙ¹ the root curve has degree 1 against O(1) and degree m against O(m). A type-A simple cover with minuscule fundamental weight has bond 1; replacing every divisor multiplicity by 1 would lose higher pairings.

### Dependencies

S1–S3; S5 normality and cohomology; S4.3 cover bonds; SchemeAndStackFoundations §5 cycles and intersections; LieGroups flag topology.

## Layer 8: Algebraic flag K-rings and characteristic maps (S8)


### 8.1 Flag Grothendieck groups

Consume the generic coherent/exact Grothendieck and perfect-complex owners. On smooth projective G/P verify the hypotheses of the supplied regular/quasi-projective finite-resolution comparison and identify its vector-bundle K₀≃coherent G₀ maps. Do not assert this equality on singular Schubert varieties. Their structure sheaves define ambient classes by proper coherent pushforward and the regular ambient resolution. Export the supplied products, duals, tensor twists, derived proper pushforwards and Tor/flat/perfect-range pullbacks on these flag objects, and construct their actual equivariant character/Schubert comparisons.

*Needs:* SchemeAndStackFoundations coherent/perfect K-theory and regular finite resolutions; S1's smooth flag and proper Schubert immersions. BrionFlags §3.3 gives the smooth-variety K₀/G₀ comparison.

### 8.2 Ordinary characteristic map

Construct c:ℤ[X]=R(T)→K₀(G/B−), eλ↦[Lλ], its augmentation, restriction and Weyl comparisons. If the derived group of G is simply connected, prove the integral presentation R(T)⊗_(R(G))ℤ≅K₀(G/B−), with ℤ carrying dimension augmentation. After identifying the character image with R(T)^W, the ideal is generated by f−ε(f), f invariant; it is not the ideal generated by the whole invariant ring, which contains1. Prove the integral basis/rank and actual induction/restriction/projective-bundle or Schubert-filtration comparisons establishing surjectivity and kernel.

- The characteristic map takes addition of characters to tensor product and the zero character to the unit.
- Its rank is the dimension augmentation, and each invariant relation is f−ε(f).
- The presentation compares actual associated lines and Schubert classes.

**Checks.**

- On SL₂/B− put t=[O(−1)]; then (1−t)²=0, t has rank 1 and [O(1)]=t⁻¹.
- At λ=0 the class is 1, not 0; quotienting by all invariants would kill this unit.
- For a torus flag the quotient is ℤ: every character becomes 1 under augmentation.

*Needs:* S3.1; S8.1; ReductiveGroups rational representation rings; S5–S7's geometric push-pull and Schubert filtration. The kernel and surjectivity are integral assertions in the simply-connected-derived range.

### 8.3 Equivariant characteristic map

In the same simply-connected-derived range construct K₀^T(G/B−)≅R(T)⊗_(R(G))R(T), specify which factor is the base character and which gives associated lines, and compare its augmentation to item2. For a partial flag use R(P−)=R(L) and the corresponding character presentation, with the actual Levi Weyl subgroup and bundle comparison. Prove the finite free/basis statements needed for these tensors; do not assume rational invariants imply their integral version.

Specify the equivariant map by a⊗eλ↦a·[L(λ)]: the first factor is the base T-character, the second the associated line. Forgetting equivariance augments the first factor, giving the ordinary presentation after swapping the two displayed tensor factors.

- Restriction to eB− sends a⊗eλ to a·eλ.
- At wB− it sends the same tensor to a·e^(wλ).
- Parabolic pullback is induced by restriction of Levi representations to T.

**Checks.**

- For SL₂ and the weight-one character z, 1⊗z restricts to z at e and z⁻¹ at s, whereas z⊗1 restricts to z at both.
- At λ=0, 1⊗1 restricts to 1 at both fixed points.
- For P=G, the partial presentation is R(T)⊗_(R(G))R(G)=R(T); forgetting equivariance gives ℤ.

*Needs:* S3.1; S8.1–8.2; ReductiveGroups Levi representation rings and restriction; S8.1's equivariant flag comparisons.

### 8.4 General isogeny types

For a general isogeny type retain c and its actual integral image. Use the derived simply connected cover's flag isomorphism to present ordinary K₀ with its larger available line lattice, proving compatibility and independence of the displayed choice. Rational comparison from the original lattice is separate. For PGL₂, its flag is P¹ but the root-character line is O(2); its image misses a primitive integral degree-one class. This is a required counterexample to an unqualified integral original-lattice presentation. Keep central torus characters and augmentation relations explicit.

- The original-lattice characteristic map commutes with the central-cover flag isomorphism.
- Ordinary line classes use the cover lattice when descent of a linearization fails.
- Rationalization is compared separately from the integral image.

**Checks.**

- On PGL₂/B≃ℙ¹, with u=[O(1)]−1 and u²=0, the root character gives [O(2)]=1+2u, so the image is ℤ+2ℤu and misses u.
- On the SL₂ cover the weight-one character gives 1+u, recovering the missing primitive class.
- After tensoring with ℚ, u=([O(2)]−1)/2 is in the image; over ℤ this division is not allowed.

*Needs:* S8.2–8.3; ReductiveGroups central-isogeny quotient comparison; S3.1's fibre-character and forgetful maps.

### 8.5 K-theoretic push-pull

Construct push-pull Demazure operators on these K-groups and compare them with S3's integral character operators, including word/Levi laws. Compute Schubert structure-sheaf and ideal-sheaf bases and pairings using the actual coherent duality and Euler pushforward. Distinguish those bases from line-bundle characters, ordinary cohomology classes and quantum/K-theoretic puzzle rules; none of those extra rules follows from the ordinary TPC puzzle theorem.

- Push-pull is defined by the actual rank-one projection, not by identifying K₀ with a character ring in every isogeny type.
- The operators satisfy idempotence and braid relations through derived composition.
- Euler pairing compares the structure-sheaf and boundary-ideal bases with their duals.

**Checks.**

- On ℙ¹, χ(O)=1 and χ(O(−1))=0, so their push-pulls are 1 and 0.
- χ(O(−2))=−1, giving −[O] under push-pull; replacing Euler characteristic by h⁰ gives the incorrect value 0.
- For the point flag, push-pull is the identity of ℤ.

*Needs:* S8.1–8.4; S3.3; S5.7; coherent Euler pushforward and duality from SchemeAndStackFoundations. BrionFlags Theorem 3.4.1 supplies the complex flag basis-pairing comparison.

### Examples

For ℙ¹, put t=[O(−1)]; then (1−t)²=0, while its rank is 1. The point flag has K-ring ℤ. These distinguish the rank map from the full flag K-ring.

### Dependencies

S3, S5–S7; SchemeAndStackFoundations coherent/perfect K-theory and Euler pushforward; the actual line-character map and stated isogeny hypotheses.

## Layer 9: Complex realization, fixed-map traces and existing comparisons (S9)

### 9.0 Coherent analytification and proper comparison

Construct complex analytic spaces as locally ringed spaces locally isomorphic
to zero loci of coherent holomorphic ideals in open subsets of finite-dimensional
complex vector spaces, with the quotient sheaf, not just the reduced zero set.
Allow non-Hausdorff spaces for gluing. Construct their morphisms, open and closed
subspaces, fibre products and gluing. For every locally finite-type complex
scheme X, construct its analytification a_X:Xᵃⁿ→X by its representing property
for morphisms of locally ringed ℂ-spaces from analytic spaces. Prove independence
of affine presentations, open gluing and compatibility with fibre products.
The underlying points are X(ℂ); separated finite-type X gives a Hausdorff,
second-countable space. Identify smooth charts with their holomorphic charts;
this does not construct the additional fixed-model tangent/connection interfaces
(SGA1, Exposé XII, Theorem 1.1 and §§2–3, retyped pp. 239–247).

- At a complex point, the algebraic-to-analytic local-ring map is faithfully
  flat and induces an isomorphism on completed local rings.
- Closed immersions retain their defining ideals and nilpotents; open
  immersions and fibre products have their universal comparison maps.
- Define coherent analytification by a_X*F on the native module-sheaf carrier, using RealAnalyticGeometry R3.2’s coherence predicate.
  Prove exactness, faithful detection of zero coherent sheaves, and tensor,
  locally free dual, coherent Hom and local Ext comparisons. Construct the
  natural cohomology and higher-direct-image exchange maps by adjunction and
  Leray, compatible with composition and coherent exact sequences (SGA1,
  Exposé XII, Proposition 1.3.1 and §4.1, pp. 241, 247–248).

**Checks.**

- Affine n-space for n=0,1,2 gives a point, ℂ and ℂ², with coordinate maps
  the identity; the completed stalk at the origin is ℂ, ℂ[[z]], ℂ[[z₁,z₂]].
- Spec ℂ[ε]/(ε²) has one analytic point but a two-dimensional structure ring:
  ε²=0 and ε≠0 on both sides. Reduction would give dimension 1 instead.
- The nodal curve xy=0 has completed local ring ℂ[[x,y]]/(xy), with nonzero
  x and y but xy=0; a manifold-only construction cannot model this stalk.

*Needs:* ComplexKahlerGeometry K3–K4 (holomorphic germs, Weierstrass division
and sheaves); SchemeAndStackFoundations Layers 1–2 (locally ringed spaces,
module sheaves, gluing and derived cohomology); RealAnalyticGeometry R3.2
(native coherence and coherent kernels). Extend coherence from ambient
holomorphic germs to their coherent ideal quotients here, and construct the
finite-presentation and completion comparison in the proof of SGA1 XII.1.1.

Prove coherent GAGA in its general proper form. For any proper morphism
f:X→Y of locally finite-type complex schemes, any coherent O_X-module F
and q≥0, the canonical exchange map
(R^q f_*F)ᵃⁿ→R^q fᵃⁿ_*(Fᵃⁿ) is an isomorphism. For a proper complex scheme X,
analytification gives an equivalence Coh(X)≃Coh(Xᵃⁿ), compares all coherent
cohomology and Ext groups, and respects tensor products and proper pushforward.
Singularities and nilpotents are allowed (SGA1, Exposé XII, Theorems 4.2 and
4.4, Corollary 4.3, retyped pp. 248–251; SerreGAGA, §12, Theorems 1–3,
pp. 19–20, for the projective starting case).

A proof route constructs the analytic projective-twist cohomology and finite
twist presentations, then uses descending cohomological induction for projective
morphisms and Chow modification with coherent support dévissage for proper ones.
Develop the required analytic coherent cohomology first: coherent quotients of
ambient holomorphic sheaves and exact coherent direct image for closed analytic
immersions. For a closed analytic subspace of a Stein manifold, identify its
coherent cohomology with that of its coherent direct image and apply
RealAnalyticGeometry R3.2’s Cartan B. Apply this general comparison to the
projective cover, and construct the Laurent-series Čech comparison for twists over a polydisc
base, and finite twist presentations of coherent sheaves on projective analytic
space (SerreGAGA, §§13–17, pp. 20–27; SGA1 XII.4.2, projective-case proof).
The proper equivalence uses coherent Hom and Ext¹ comparison to algebraize
extension classes in support induction; an extension is not replaced by its
split direct sum. SchemeAndStackFoundations §4.12 supplies Chow modification.

- Identity and composition of proper morphisms commute with the same exchange
  maps, as do the long exact sequences of coherent cohomology.
- Compare the algebraic and analytic base-change morphisms for cartesian squares;
  conclude an isomorphism when the algebraic base-change theorem applies,
  for example for flat change of base. No arbitrary underived base-change
  isomorphism is asserted.
- Equivariant structures transport by naturality in the action and cocycle
  maps; for proper X this compares the actual cohomology representations,
  rather than just their dimensions.

**Checks.**

- For f=id the exchange in degree 0 is the identity, and higher direct images
  are zero; the zero coherent sheaf gives zero in every degree.
- For ℙ¹ over ℂ, O(−2) has H⁰=0 and H¹=ℂ on both sides. Over the base ℂ[s],
  R¹π_*O(−2)=O, whose analytification allows the holomorphic coefficient exp(s).
- The proper dual-number point has H⁰ with basis 1,ε and zero higher groups.
  In contrast on affine ℂ, the endomorphism exp(z) of the analytic trivial line
  is not algebraic; properness cannot be dropped from full faithfulness.
- Over A=ℂ[t], an extension 0→O(−2)→E→O→0 on ℙ¹_A with class t
  has cohomology complex [A→A] with differential multiplication by t.
  H⁰ is zero over A but becomes ℂ at t=0; the underived degree-zero
  base-change map 0→ℂ is not an isomorphism, on either side of GAGA.

*Needs:* the analytic-space and coherent-pullback construction above;
SchemeAndStackFoundations §§2.2, 2.6, 4.12 (coherent pushforward, projective
cohomology and Chow modification); RealAnalyticGeometry R3.2 (Cartan A/B). This comparison precedes the flag
specialization and uses no Schubert vanishing or standard monomial theorem.

### 9.1 Flag and word specializations

Over ℂ compare the actual algebraic flag, Schubert and word schemes with their analytic/topological carriers, actions, tautological/associated bundles and maps. Use S9.0’s analytification and projective coherent GAGA at the actual objects. Identify the compact homogeneous flag model and its rank-one factors through LieGroups, and compare typeA subspace/quotient/Plücker models with ModularCurves §0G and TopologicalKTheory T1.5. Ordinary relative forms and field changes retain their actual algebraic hypotheses; the complex comparison is not their substitute.

   For the flag and word models, compare their homogeneous root charts,
   equivariant actions and associated-line transitions with the corresponding
   analytic charts. These are the specified flag and word comparisons of S9.1.

- The comparison preserves root charts, their transition maps and quotient actions.
- Tautological and associated bundles have the same fibre maps and transition functions.
- Tower maps, multiplication and Schubert restriction commute with analytification.

**Checks.**

- The empty word analytifies to a point, and a one-letter word to ℙ¹(ℂ).
- On the rank-one affine chart, the regular coordinate z becomes the same holomorphic coordinate z; its derivative is 1.
- Over the dual-number base ℂ[ε]/(ε²), the corresponding chart retains ε≠0; passage to the reduced space would make the bundle comparison lose its base ring.

*Needs:* S1–S2 and S3.1; S9.0; LieGroups Layer 8 and TopologicalKTheory T1.5. This is the specialization of SGA1 XII.1.1 and XII.4.2 to these models.

### 9.2 Holomorphic Lefschetz input

Consume the following map-level holomorphic Lefschetz interface from IndexTheory's fixed-map trace construction. If f:M→M is holomorphic on a compact Hausdorff second-countable finite-dimensional boundaryless complex manifold, all fixed points are isolated with det_ℂ(1−df_x)≠0, E is a holomorphic vector bundle and φ:f*E→E is a specified holomorphic bundle map, then the alternating trace of φ∘f* on coherent/Dolbeault cohomology is Σ_x tr(φ_x)/det_ℂ(1−df_x). The generic construction owns positive-time heat smoothing/trace class, cohomological supertrace and the local graph/diagonal calculation; arbitrary pullback is not assumed L²-bounded and f need not be an isometry.

*Needs:* IndexTheory I8, with its holomorphic fixed-map trace and bundle-lift hypotheses; S9.0 coherent/Dolbeault comparison. For the identity of a point, numerator and determinant are 1, giving trace 1; the identity of ℙ¹ does not meet the isolated-fixed-point hypothesis.

### 9.3 Word fixed-point formula

For section action (g·s)(x)=g_Es(g^−1x), apply that formula with f=g^−1 and φ=g_E on pulled-back fibres. The differential pullback has the eigenvalues of df, not automatically their inverses. At e of G/B−, tangent weight+α for t gives df for t^−1 with weight−α; the denominator is1−e^(−α) and the fibre contributes eλ. For the word model use S2's actual subword weights to prove χ_T(Z,π*Lλ)=Σ_ε e^(w_rλ)/∏_j(1−e^(−β_j)) in the stated localization. Prove for generic t that its fixed points are exactly those sections and every denominator is nonzero. A finite whole-torus fixed locus does not make the expression defined for every t.

- The localization sum uses the inverse group element in the base map and the given lift on the bundle.
- Prefix products determine both tangent and fibre weights at every fixed subword.
- Character identities hold in the localization, then descend by the finite-string cancellation.

**Checks.**

- For SL₂ with weight-one torus value z=2 and L(1), the two contributions are 2/(1−1/4)=8/3 and (1/2)/(1−4)=−1/6; their sum is 5/2=z+z⁻¹.
- At z=1 both denominators vanish, although the character is 2; the localized summands cannot be evaluated individually there.
- For the empty word, the product of denominators is 1 and the sum is the single fibre character eλ.

*Needs:* S2.3; S3.1 and S3.3; S9.1–9.2. The two-term formula fixes the action convention before the word induction.

### 9.4 Character comparison

Sum the rank-one contributions to obtain S3's exact Demazure recurrence and compare with the independently constructed algebraic Euler/vanishing argument. Prove polynomial cancellation of the localization formula and its integral character meaning. The full longest-word result recovers the Weyl character formula in the stated characteristic-zero analytic lane. It does not prove positive-characteristic geometric vanishing by itself.

*Needs:* S9.3; S3.3's integral cancellation; S5.5 and S5.7 for H⁰ interpretation. For SL₂ and O(−2), Euler characteristic is −1 but h⁰=0, so this comparison must retain Euler classes outside the dominant range.

### 9.5 Type-A path specialization

Specialize S4.1–5 to the full type-A root datum, retaining the GLₙ central
lattice and its actual SLₙ restriction. Prove that its simple coroot heights
are adjacent coordinate differences, with the same endpoint, concatenation,
root-operator and central-transport laws. For GL₂ the straight path t↦(t,0)
has height t and lowers to t↦(0,t); a central shift by (1,1) preserves the
height and changes the endpoint to (2,1).

*Needs:* S4.1–5; RootSystems Layer 6's type-A datum and ReductiveGroups' actual central character lattice.

- Adjacent coordinate differences are the simple-coroot heights under the type-A map.
- Endpoint, concatenation and root operators commute with specialization.
- Canonical LS central transport keeps the GLₙ central lattice.

**Checks.**

- The GL₂ path (t,0) has height t and lowers to (0,t), changing endpoint (1,0) to (0,1).
- Adding central (1,1) gives endpoint (2,1) with the same simple height t.
- A pure central path (t,t) has endpoint (1,1) but zero simple height; passing to SL₂ would lose this endpoint data.

### 9.6 Cellular and normalizer comparison

Compare the resulting integral full-flag CW classes with the Schubert Chow/degree comparison of S7.3; no new Grassmannian characteristic-map owner is introduced. As the compact-normalizer application, for compact connected K and maximal torus T use the actual free finite covering K/T→K/N(T) with deck W, AlgebraicTopology Stage 5 item 3's singular-cohomology transfer over ℚ and the flag's even-cell Euler characteristic |W|. Prove H⁰(K/N(T);ℚ)=ℚ and all positive-degree groups vanish. Over ℤ averaging is unavailable: for SU₂ identify K/N(T)=ℝP² and compute H⁰=ℤ, H²=ℤ/2 and other positive cohomology zero. The generic compact BG/BT invariant/Chern–Weil comparison remains at CharacteristicClasses C5; the source's invariant-degree/Coxeter-exponent and exterior-cohomology formulas require that owner's actual invariant-theory/transgression interfaces and are not inferred from this rational-normalizer calculation.

*Needs:* S7.3; LieGroups Layer 8; AlgebraicTopology Stage 5 item 3 finite-covering transfer. For SU₂ the rational quotient has only H⁰=ℚ, while integral H²=ℤ/2; averaging over its order-two Weyl group cannot be performed integrally.

### 9.7 Moment–Morse comparison

Construct the compact moment-Morse comparison with [HamiltonianReduction R2a](../HamiltonianReduction/README.md) on its SAME homogeneous coadjoint orbit. For compact connected K, a real dominant μ∈t and H=K_μ, use LieGroups Layer8 and S9.1 to identify K/H with the analytic partial flag G/P− whose Levi roots vanish on μ. No integrality or prequantization of μ is required for this diffeomorphism; an associated line still requires the actual character lattice. Compare the inclusion derivative, root-plane coordinates, T action and the actual KKS form. At p∈O_μ∩t construct the invariant complex structure by J_flag|E_α=sign(α(p))J_α on the tangent planes α(p)≠0 and prove that it is the integrable structure transported from this flag. Then ω(v,J_flag w)=B(v,w)/|α(p)| on those planes. Extend the equality equivariantly and construct the positive K-invariant Kähler metric, rather than assume the arbitrary metric used for the Morse chart has this property.

   For regular X in the negative chamber, prove grad(f_X)=J_flag X_O and the complete negative-gradient flow is the complexified action exp(−itX). Construct its coordinate action in the actual root-subgroup charts and prove its unstable manifolds are the standard B− cells C(w), of complex dimension ℓ(w), with backward limit wμ; its stable manifolds are the opposite cells. The compact flow model is being compared to those root-coordinate cells, not used to define the algebraic Schubert schemes. For positive X, retain index(f_X)=dim(O_μ)−2ℓ(w) and use −f_X for the same index-2ℓ(w) model. Zero stabilizer roots are omitted on partial flags, and central components change only the height constant. Prove the convergence/limit and cell-coordinate statements and the parabolic projection when μ lies on a wall, with X still regular in the chosen chamber, not just agreement of cell counts or characters. If instead X lies on a wall, use R2a's centralizer-orbit Morse–Bott strata and their negative normal bundles; do not assert the same isolated-critical-point/Bruhat-cell statement for that height. An arbitrary invariant metric need not have these Bruhat unstable manifolds.

   Compare the MorseTheory M2 negative-handle characteristic maps and the existing LieGroups/TopK flag characteristic maps by actual relative-pair maps, root-coordinate orientations and compatible finite filtrations. Distinct-value height choices and simultaneous critical levels must give the same labelled comparison under the constructed handle-continuation maps. Use the complex orientation of each negative root-plane sum; check independence from torus choices of normalizer representatives, whose root-plane rotations have positive real determinant. Compare the resulting integral cellular/singular generators with S7.3's pushed-forward resolution classes and their coefficient1 on the open cells, including the boundary/attaching-map comparison. A singular Schubert closure need not be a ball and is not declared to be the image of an embedded Morse disc. Export the finite even-cell Poincaré polynomial Σ_(w∈W/W_μ)q^(2ℓ(w)), torsion-free integral groups and |W/W_μ| Euler characteristic with these actual comparison maps. Multiplicative Schubert/cohomology formulas retain their S7 construction and the named downstream applications; they do not follow merely from a vanishing cellular differential.

   This is a later application of HR R2a, the independent compact LieGroups foundations, the existing root-cell/complex-realization maps and MorseTheory's generic attachments. It is not a prerequisite for LieGroups Layer6 conjugacy, S4's generic LS engine, ReflectionInvariantTheory §§1–3 polynomiality, or CharacteristicClasses C5/C5a Borel/compact cohomology. Retain S9.6's normalizer/Weyl transfer and SU₂/ℝP² test at that single owner.

- The comparison uses the KKS form and the root-plane complex orientation.
- Negative gradient limits identify the Bruhat cells with their actual flow coordinates.
- The handle maps preserve the same integral cellular generators as the resolution classes.

**Checks.**

- For the point orbit, the Poincaré polynomial is 1, the Euler characteristic is 1 and all tangent spaces have dimension 0.
- For the rank-one orbit ℙ¹, the two indices in the negative-chamber convention are 0 and 2, giving Poincaré polynomial 1+q² and Euler characteristic 2.
- For a central height element on the same ℙ¹ orbit, the height is constant and the critical set is all ℙ¹; it is not a pair of isolated points.

*Needs:* HamiltonianReduction R2a; LieGroups Layer 8; S9.1; S7.3; MorseTheory M2. The root-plane KKS formula and flow construction give the comparison route.

### 9.8 Associated-line analytification

For a complex reductive G and parabolic P−, specialize S9.1's tensor-compatible
analytification of locally free sheaves to S3.1's algebraic associated lines.
Construct the holomorphic associated-line model by the same fibre character
and compare its transition functions, fibre at eP− and G action with the
analytification. Prove that the algebraic fibre/associated-line unit and counit
become the holomorphic ones, naturally for equivariant isomorphisms, tensor,
dual and parabolic pullback. This is the algebraic-to-holomorphic adapter;
it does not reconstruct the ordinary Picard group or the compact character-to-degree map.

- The comparison sends the fibre class [1,z] to the same fibre element z.
- The tensor comparison sends [g,z]⊗[g,w] to [g,zw], and duality negates the character.
- Restriction along a parabolic projection preserves the associated character and these maps.

**Checks.**

- For SL₂/B−, the weight-one character gives O(1) on both sides and root degree +1.
- The zero character gives the trivial line, with tensor unit mapped to 1.
- For a torus the flag is a point; characters 0 and 1 give the same ordinary
  line but distinct equivariant fibres, so forgetting the action cannot be an equivariant inverse.

*Needs:* S3.1's algebraic equivariant-line equivalence; S9.1's locally free
GAGA comparison; LieGroups
Layer 8's homogeneous complex flag.

### Examples

For the proper dual-number point, algebraic and analytic H⁰ both retain ℂ[ε]/(ε²), with ε nonzero. For SU₂ the normalizer quotient is ℝP²: rational positive cohomology vanishes but integral H² is ℤ/2. For the point partial flag, its Poincaré polynomial is 1.

### Dependencies

S1–S8 at the targets that use them; S9.0 for coherent analytification and proper GAGA; LieGroups Layer 8; IndexTheory I8; HamiltonianReduction R2a; AlgebraicTopology Stage 5 item 3 and MorseTheory M2.

## Worked examples

- TypeA: the six minors of an actual two-frame in k⁴, their signs/change of frame, the Gr(2,4) Plücker quadric, coordinate-chart inverse, Schubert ideals, dimensions and all-degree bases. Include signed determinant-one SL representatives, the full block-monomial normalizer/stabilizer dictionary, the symplectic antidiagonal-form block parabolic and the source root-action/contragredient wedge signs. Include zero subspace/full subspace and the determinant line; claims that a tautological subbundle has no global sections need the correct nontrivial-rank range.
- **A fixed-plane stabilizer on a Grassmannian.** Over a field k, fix
  V=k^n, 0≤k₀≤n and a specified k₀-plane U⊂V; write P=Stab_GL(V)(U).
  Use the existing Grassmannian and tautological subbundle S, and the
  actual map S→(V/U)⊗O. For
  max(0,2k₀−n)≤d≤k₀ define the locally closed rank-exact stratum O_d
  by rank(S→V/U)=k₀−d. Its geometric points are exactly the k₀-planes
  W with dim(U∩W)=d. Prove each stratum is one P-orbit and give actual
  transporter matrices: extend a basis of U∩W to adapted bases of U,W,V,
  and map the resulting adapted bases for two planes to one another while
  preserving U. Give the inverse and check the block-matrix equations;
  over k this also proves transitivity on the k-rational points.

  Choose V=U⊕U' and bases u₁,…,u_k₀ and v₁,…,v_(n−k₀). The plane
  W_d=span(u₁,…,u_d,v₁,…,v_(k₀−d)) is an explicit representative.
  Compare these representatives and transporter maps with ReductiveGroups Layer 7b's actual
  parabolic double-coset map, obtaining
  (S_k₀×S_(n−k₀))\S_n/(S_k₀×S_(n−k₀))≃{d:max(0,2k₀−n)≤d≤k₀}.
  Prove the number of orbits is min(k₀,n−k₀)+1. Choose an adapted full
  flag when comparing with S1's Borel conventions; conjugation must carry
  its stabilizer and all the representative maps, not just the count.

  Let Z_d be the closed determinantal scheme cut out by the
  (k₀−d+1)-minors of S→V/U. If this size exceeds the source or target
  rank, there are no such minors and the ideal is zero; in particular
  Z_0=Gr(k₀,V) whenever d=0 is admissible. Prove these schemes are geometrically
  reduced and irreducible by comparison, in an adapted full flag, with
  S1's existing single-flag Schubert rank-condition schemes and their
  reduced closures. Their underlying closed sets satisfy
  closure(O_d)=|Z_d|=⋃_(e≥d)|O_e|, over the admissible e, and
  closure(O_e)⊆closure(O_d) iff d≤e. Prove density and the order using
  the rank charts and actual one-parameter plane degenerations; a count
  of double cosets alone does not determine closure order. This displayed
  union is a stratification of underlying sets, not a scheme union of
  the locally closed strata. Keep determinantal ideals, reducedness and
  field-extension comparisons on the existing scheme carriers.

  For k₀=0 or k₀=n there is exactly one plane and one orbit, including
  n=0; for n=1 these are the only cases. No positive-rank matrix minor
  or nonempty choice of complement vectors is required in these cases.

- For 1≤r≤dimV and nonzero θ∈ΛʳV, prove decomposability iff (ι_ηθ)∧θ=0 for every η∈Λ^(r−1)V*, by constructing the vector-valued contraction-image subspace and its basis. Include θ=0 as the affine-cone origin separately. For r=0 use Λ⁰V=k and its unique projective point, without that vector-valued contraction criterion; for r>dimV the exterior power is zero and its projectivization is empty. Compare this basis-free criterion with the already owned polynomial Plücker ideal and the actual universal image, retaining the exterior-algebra signs in every characteristic.
- For the rank-d tautological subbundle on the full flag over an algebraically closed field, prove H⁰(S_d)=0 when 0<d<N, and explicitly handle d=0 and d=N. Identify H⁰(S_d*) and its determinant sections through the actual induced-module/evaluation map. Multiplication of fundamental section spaces gives the Cartan-product quotient, not an unqualified isomorphism with the entire tensor product.
- For nonempty integral finite-type projective X and nonempty open U, compare the homogeneous degree-zero fraction field with the actual function field k(X)=k(U), and dimX=trdeg_k k(X) over a field. The local regular-section ring O(U) is not itself that fraction field; give the homogeneous affine-chart/homogenization maps and apply them to the Schubert cell dimension calculations.
- The complete flag→incidence product→Plücker→positive Veronese→Segre composite has its actual closed immersion and line pullback. Zero exponents contract flag directions and are not automatically embeddings; strictly positive relevant coefficients give the intended ample partial/full-flag model.
### The three-dimensional incidence flag and its eight-dimensional representation
 Over ℂ fix V=ℂ³ and
  its ordered basis. Write v=(a,b,c) and
  ω=x(e₂∧e₃)+y(e₃∧e₁)+z(e₁∧e₂). Identify the actual complete flag
  (L,P) with ([v],[ω]) in P(V)×P(Λ²V), where L=ℂv and P is the
  plane represented by ω. Construct the scheme/analytic comparison and
  inverse, with incidence equation `v∧ω=0`, hence `ax+by+cz=0`.
  Under Segre this is a linear equation in the nine coordinates
  ax,ay,az,bx,by,bz,cx,cy,cz; retain the Segre quadratic relations.

  Construct the GL(V)-equivariant isomorphism
  `V⊗Λ²V≃End(V)⊗det(V)` by sending v⊗ω to the map
  `u↦v⊗(u∧ω)`. Prove that its trace is v∧ω. The flag's image thus
  lies in P(sl(V)⊗det(V)), a projective7-space inside the ambient
  projective8-space. Prove its linear span is exactly sl(V)⊗det(V):
  obtain the off-diagonal matrix units from incident coordinate pairs
  and diagonal differences from rank-one trace-zero matrices together
  with those units. This is an eight-dimensional submodule, with
  GL₃ highest weight (2,1,0), not the whole nine-dimensional tensor.

  Identify the section representation separately. Twist the incidence
  hypersurface ideal sequence by O(1,1), and use the existing projective
  coherent-cohomology calculation to prove H¹(O) of the product vanishes.
  Restriction then identifies H⁰(Flag(V),O(1,1)) with the quotient of
  `(V⊗Λ²V)*` by the one-dimensional incidence-equation line, hence with
  `(sl(V)⊗det(V))*`. Construct its restriction/evaluation maps, kernel and
  equivariance; its highest weight is (0,−1,−2) for ordinary dual action.
  Preserve this dual distinction when applying S3's line convention.
  Compare negative determinant twists, which change the GL₃ module
  while preserving the underlying projective flag embedding. These maps
  supply BorelWeil pp4–5's explicit8-versus9 calculation.
- For the finite chain/convexity API include a single cover, an equal endpoint with gcd0, incomparable endpoints, the arithmetic a-chain criterion with denominator1 (outside the internal LS break range), a chamber-wall stabilizer, nonsimply-laced rank-two bonds, and a pure central straight path. The wall case must give equality of cosets when the coroot pairing vanishes; the pure central case must retain the scaled convexity statement.
- For central transport in GL₂, take π(t)=(t,0), χ=(1,1) and the increasing rational PL reparametrization φ(t)=t/2 for t≤1/2 and φ(t)=3t/2−1/2 for t≥1/2. The paths π and π∘φ represent the same class. The shifted π lies on x=2y, whereas (π∘φ)(1/2)+(1/2)χ=(3/4,1/2) does not. Verify this regression against an ambient quotient-level central action, and recover B(λ)→B(λ+χ) through the canonical LS representative instead.
- For SL₂ use P¹, O(m), the m+1 character string and degree m. In characteristicp compare induced, Weyl and simple modules, including the pth symmetric-power/Frobenius stabilizer example and the n=4,p=3 binomial cyclicity counterexample. A unique highest line need not imply a module is generated by that line.
- **The word121 blowup of the three-dimensional full flag.** Fix a
  three-dimensional vector space V over a field and an initial plane P₀.
  Number the simple changes so that1 changes a line and2 changes a plane.
  Compare S2's actual word121 carrier with triples
  (L₁,P,L), where L₁≤P₀, L₁≤P and L≤P, and all lines/planes have their
  stated ranks. Construct the two-sided scheme and equivariant comparison,
  including the initial flag convention and base change; the final map is
  (L₁,P,L)↦(L,P) in F=Flag(1,2;V). Off C={(L,P₀):L≤P₀}, its inverse is
  L₁=P∩P₀. Construct this intersection as a rank-one subbundle on the open
  P≠P₀, with its regular inverse maps, rather than a pointwise dimension rule.

  Use StableReduction Layers2/4's relative Proj/Rees blowup construction,
  affine charts and universal property. Over B=Gr(2,V)≃P(V*), the incidence
  pairs (L₁,P) with L₁≤P₀∩P identify with Bl(P₀,B). In a chart at P₀ write
  the moving plane as the graph z=ux+vy relative to P₀. The incidence
  equation is ux+vy=0 on P(P₀); identify its line coordinate [x:y] with
  the blowup direction [−y:x], so the two Rees charts have equations
  v=u·r and u=v·s, with r·s=1 on their overlap. Give the actual chart
  isomorphisms, both inverses and transition maps, valid over every field
  including characteristic2; no analytic argument or division by2 is used.

  The projection F→B is the projective bundle of lines in the universal
  plane, hence flat. Prove the flat-base-change comparison of the Rees
  algebras degree by degree and their relative Proj, using the same
  StableReduction supplier, and apply it to the ideal of P₀. This constructs
  BS(121)≃F×_B Bl(P₀,B)≃Bl_C F over F. Record the ideal of C, its pullback
  invertibility, exceptional Cartier divisor, universal factorization and
  compatibility with the open inverse; a proper birational map with P¹
  fibres alone does not establish this blowup identity.

  The center C is P(P₀)≃P¹. Compute N(C/F) from the smooth projection to
  B: it is the constant rank-two bundle T(P₀)B⊗O_C. Construct this
  identification from the chart differentials and their transition maps.
  Thus the exceptional divisor is P_C(N(C/F))≃P¹×P¹, with the first
  factor the final line L and the second the choice L₁/blowup direction;
  its projection to C forgets L₁. Prove the exceptional normal line is the
  tautological O(−1) in the second factor. This supplies the actual
  trivialization requested by the example, rather than inferring it from
  a section. Compare with all eight fixed subwords and the existing
  four-tetrahedron model, preserving their actual Borel/action conventions.
  Compare the two zero-weight adjoint path indices without inventing unread diagram labels. Use S4.4’s adjoint simple-generator positive test and its separate all-root obstruction.
- For general root type retain parabolic projection, minuscule versus nonminuscule divisor multiplicities, all-degree Demazure/path bases, scheme-theoretic reduced union/intersection and the degree/Chevalley formula. Kac–Moody and general quantum-group/canonical-basis statements are separate source programmes; the finite-type engine here is not a proof of them. Integral divided-power and rational-module source assertions are consumed from the exact RG owner, not silently reproved by geometric characteristic-zero arguments.

## Downstream consumers

TensorProductCombinatorics §8.3 owns the coordinate-path and operator comparison
with S4.1–5, and its Layer 6 owns the complex Grassmannian Schubert/puzzle
applications. These applications consume this roadmap's general theory. GeometricQuantization
§§3.3–3.4 consumes S9.1/S9.7's partial-flag, Kähler and root-oriented cell
comparisons for its ordinary Picard and forgetful-map conclusions.


## References

Proof routes include the original Knutson Bott–Samelson/Demazure handouts and algebraic-varieties notes for these applications; Littelmann's *Paths and root operators in representation theory* for the finite path/linking construction; Lakshmibai–Littelmann–Magyar's *Standard monomial theory for Bott–Samelson varieties*, Compositio Mathematica 130 (2002), Theorem 4 (§1.3, p. 299) and Theorem 6 (§1.4, p. 301), for the standard bases and section/vanishing comparisons; and the root-coordinate/splitting/coherent constructions stated in S5. For the finite saturated-chain bond theorem use Chirivì–Fang–Littelmann, [*LS algebras, valuations and Schubert varieties*, arXiv:2203.12992v1, Definition 2.1 (p. 4) and §7.1 (p. 18)](https://arxiv.org/abs/2203.12992v1), in its dominant-weight/minimal-parabolic-coset setting; construct its chain-independent gcd through the combinatorial targets of S4.3. Each cited generic foundation retains its single owner.

Source keys: LLM denotes the published 2002 article, with
Theorem 4 at LLM line 251 and Theorem 6 at LLM line 324. CFL denotes
arXiv:2203.12992v1, with Definition 2.1 at CFL line 188 and the Schubert
bond specialization at CFL line 960. The latter uses a dominant weight and
minimal representatives in the parabolic Weyl quotient; its characteristic-zero
geometric application does not supply positive-characteristic splitting.


For the relative parabolic quotients and integral root charts, use Brian
Conrad, *Reductive group schemes*, Theorem 2.3.6, pp. 72–73, Theorem 5.1.13,
p. 143 and Corollaries 5.2.8–5.2.9, pp. 155–157 (ConradReductive lines 2993,
6011, 6512 and 6551). For coherent analytification and proper GAGA, use
*Revêtements étales et groupe fondamental (SGA 1)*, arXiv:math/0206203v2,
Exposé XII, Theorem 1.1, Proposition 1.3.1, Theorems 4.2 and 4.4 and
Corollary 4.3 (SGA1 lines 9399, 9479, 9738, 9805 and 9801).
Jean-Pierre Serre, *Géométrie algébrique et géométrie analytique*, Annales de
l’Institut Fourier 6 (1956), §12, Theorems 1–3, pp. 19–20, and §§13–17,
pp. 20–27, gives the projective proof (SerreGAGA lines 735, 741 and 746).
The scheme-theoretic nilpotent generality is taken from SGA1.

Michel Brion, *Lectures on the geometry of flag varieties*,
arXiv:math/0410240v1 (2004), §§1.1–1.4, 2.1–2.3 and 3.3–3.4
(BrionFlags). This source works over ℂ, with type-A coordinates; its
complex proofs do not supply the positive-characteristic splitting argument.
Allen Knutson, *Demazure character formula* course notes, §4.0.2, p. 4
(KnutsonDemazure line 142), supplies the A₂ diagram; S3.6 derives its
coefficient formula from the stated signed strings.
