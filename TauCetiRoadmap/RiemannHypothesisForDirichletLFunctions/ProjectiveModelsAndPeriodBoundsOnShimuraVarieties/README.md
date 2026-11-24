# Roadmap: projective models and period bounds on Shimura varieties

**Summary.** A semi-abelian scheme `G` over a base `S` is, fibre by fibre, an extension of an abelian variety by a torus; its Hodge bundle is `E = e^*Ω¹_{G/S}`, its Lie algebra `Lie(G/S) = E^∨`, and `ω = det E` is its Hodge line. Toroidal compactifications of PEL-type Shimura varieties carry such schemes, abelian on the interior and degenerating along the boundary. This roadmap proves, for these degenerating families and their models, the statements an arithmetic argument on unitary Shimura varieties needs beyond the existing theory of compactifications: growth bounds and positivity for the Hodge metric and the Hodge bundle; logarithmic periods over a polydisc; conjugate data in characteristic `p`, which play for a semi-abelian scheme on a curve the part of the de Rham homology of an abelian scheme with its two filtrations; ampleness of twisted Hodge lines on projective toroidal models; and normal projective models over the whole ring of integers of a number field, with a semi-abelian extension of the universal family at every prime and, in the marked form, a cubical line bundle. It also states Kempf's descent of linearised line bundles to quotients by finite groups.

The headline theorems are these. (1) *Seminegativity over curves* (6.2a). Let `C` be a smooth projective geometrically connected curve over a field of characteristic zero and `G → C` a semi-abelian scheme. Then every locally free subsheaf of `Lie(G/C)` has degree `≤ 0`; equivalently every locally free quotient of the Hodge bundle has degree `≥ 0`, so the Hodge bundle is nef. The analytic input is a growth bound: over a smooth complex variety with a normal crossings divisor `D`, for a semi-abelian scheme abelian off `D` and a polarisation of its restriction there, the Gram matrix `H` of the Hodge metric in a frame of the Hodge bundle on a polydisc where `D = {x₁⋯x_a = 0}` satisfies `|H_{ij}| ≤ C·(1 + Σ_j|log|x_j||)` and `H ≥ c·Id` with constants `C, c > 0`. (2) *Ampleness of twisted Hodge lines* (7.17a). On the projective toroidal models of normalised blow-ups of minimal compactifications in the good-prime singleton setting, in particular on the smooth integral toroidal model of a PEL datum at a good prime for a smooth projective cone system `Σ` with polarisation function `pol`, and on their generic fibres, for every sufficiently divisible `d` there is `a₀(d)` such that `ω^{⊗a} ⊗ O(−Σ_ρ d·pol(ρ)D_ρ)` is ample relative to the base for all `a ≥ a₀(d)`. (3) *Global normal projective models* (7.31a). Let `(O, ⋆, L, ⟨·,·⟩, h)` be an integral PEL datum of type A or C satisfying Lan's condition 1.4.3.10, `G` its similitude group scheme over `ℤ`, `K ⊆ G(Ẑ)` an open compact subgroup whose image in `G(Ẑ^p)` is neat for every prime `p`, and `F` a number field containing the reflex field and the values needed for the level. Then the generic fibre `Sh_F` over `F` of the PEL moduli space at level `K` has a smooth projective toroidal compactification `Sh^tor_F` and a normal scheme `Y`, projective and flat over `O_F`, with generic fibre `Sh^tor_F`, carrying a semi-abelian scheme that extends the universal abelian scheme, is abelian exactly over `Sh_F` in the generic fibre, receives the endomorphisms (and, in the form with a polarising line bundle and a marking of 7.31a (b′), a cubical line bundle extending it), and agrees with the integral toroidal model over a dense open subset of `Spec O_F`; the normalisation of a component of `Y` in a finite extension of its function field is again normal, projective and flat over `O_F`, a model of the corresponding finite cover with the pulled-back semi-abelian scheme.

The roadmap extends [ShimuraCompactifications](../../ShimuraCompactifications/README.md), whose degeneration data, integral toroidal and minimal compactifications and normalised blow-ups it uses throughout; it takes integral PEL data, similitude groups and PEL moduli schemes from [PELModuli](../../PELModuli/README.md), spreading out, Nagata rings, scheme-theoretic closures and Chow's lemma from [SchemeAndStackFoundations](../../SchemeAndStackFoundations/README.md), and relative ampleness from [StableReduction](../../StableReduction/README.md); the normalisations of the Hodge metric come from [ArakelovGeometryAndAbelianHeights](../../ArakelovGeometryAndAbelianHeights/README.md) and the Gauss–Manin connection from [AbelianSchemesAndArithmeticModuli](../../AbelianSchemesAndArithmeticModuli/README.md). In the family [RiemannHypothesisForDirichletLFunctions](../README.md), the degree of a line bundle with a metric of logarithmic growth and the Griffiths semipositivity of quotient bundles come from [SingularHermitianMetricsAndL2Methods](../SingularHermitianMetricsAndL2Methods/README.md) and give (1); the statements of this roadmap are used by [ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties](../ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties/README.md), for short integral sections of powers of the Hodge bundle, nefness on the fibres of integral models and the descent of the Hodge line to quotients by finite groups.

The layers carry the numbers of the layers they extend. Layer 6 treats degenerating families: the growth bound and the seminegativity over curves (6.2a), the logarithmic periods over a polydisc (6.7a) and conjugate data on curves in characteristic `p` (6.9a). Layer 7 treats global models: the hypotheses of 6.9a on the global model (7.12a), the ampleness of twisted Hodge lines (7.17a), and the minimal input at every prime with the global normal projective models, the cubical line bundle of the marked form and their finite covers (7.31a). Layer 9 states Kempf's descent of a linearised line bundle to a quotient by a finite group (9.1).

## Conventions

Notation and conventions not restated here are those of ShimuraCompactifications (its Conventions and Layers 6–8), of PELModuli (Layers M0–M4) and of SchemeAndStackFoundations. In particular a semi-abelian scheme is that of ShimuraCompactifications §6.1, its Hodge bundle is `E = e^*Ω¹_{G/S}` and `ω = det E` its Hodge line; cone systems `Σ`, polarisation functions `pol`, boundary divisors `D_ρ`, lattice collections `J` with the singleton collection `J₀`, the minimal inputs `M̃^min_{H,J}` and the models `M̃^tor_{H,Σ,J}` are those of ShimuraCompactifications §§7.19, 7.20 and 7.31, and the good primes of a PEL datum and a level are the primes of the set `□` of the base of ShimuraCompactifications §7.3. Integral PEL data `(O, ⋆, L, ⟨·,·⟩, h)` are those of PELModuli §M0.5, and the similitude group scheme `G` over `ℤ`, with similitude character `ν`, is that of PELModuli §M0.7.

`Ẑ = ∏_ℓ ℤ_ℓ`, `Ẑ^p = ∏_{ℓ≠p} ℤ_ℓ` and `𝔸_f = Ẑ ⊗ ℚ`. For a scheme in characteristic `p`, `Fr` is the absolute Frobenius and `Fr^*` the pull-back along it; the Verschiebung of a commutative group scheme is that of ShimuraCompactifications §6.18. For a rigidified line bundle `L` on a commutative group scheme with group law `m`, `Λ(L) = m^*L ⊗ pr₁^*L^{−1} ⊗ pr₂^*L^{−1}` ([FormalProof], `ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/SemiabelianSchemes/CubicalStructures/CubeSymmetricSwapFirst.lean` (`ReciprocityTheory.ChartRestriction.G.Semi.cubeLB`)), and on an abelian scheme `Λ(L) ≅ (1 × φ_L)^*𝒫` (AbelianSchemesAndArithmeticModuli A2.3); for a line bundle `M` on an abelian variety `B`, `K(M)` is the kernel of the map `B → B^∨`, `x ↦ t_x^*M ⊗ M^{−1}`. For an endomorphism `w` of `G`, `(1, w) : G → G ×_S G` is the morphism `x ↦ (x, wx)` ([FormalProof], `ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/BirationalGeometry/ToroidalCompactification/TwoWeightEqOneAddRoot.lean` (`ReciprocityTheory.ChartRestriction.G.Geo.Tor.SAB`)), and `𝒫` is the Poincaré bundle on `A ×_S A^∨` for an abelian scheme `A` (AbelianSchemesAndArithmeticModuli A2.2). Logarithms are natural. Internal references `k.n` name target `k.n` of this roadmap.

*CM data.* 6.9a, 7.12a and 7.31a (b′) use a CM field `E` with complex conjugation `a ↦ ā`, whose ring of integers `𝒪_E` is unramified over that of its maximal totally real subfield and which contains a square root `√−d` of `−d` for a prime `d ≡ 7 (mod 16)`, and the element `w_0 := (1 + √−d)/2` of `𝒪_E`, so that `w_0 + w̄_0 = 1`; these are the data with which 7.31a (b′) opens. There, and in the form of the formal proof recorded at 6.7a, `E` names this field; elsewhere `E` is the Hodge bundle (6.2a), the alternating form of 6.7a (a) or, in some Checks, an elliptic curve.

**Statements of the formal proof.** Where a target names [FormalProof], the form that proof establishes is recorded at the target: its
hypotheses, ranges and constants are those of the proof, including restrictions that the route written here does not
visibly use. A wider or sharper form stated beside it is this roadmap's own, proved by the route written here, and is not in
[FormalProof].

**Labels.** Under each section heading, `*Origin:*` says where its statement comes from and
`*Method of the formal proof:*` how [FormalProof] proves it. Every section carries both labels. Of 6.2a, 6.7a, 6.9a,
7.17a, 7.31a and 9.1, [FormalProof] states a part or a special case, recorded with the section: 6.2a (b), and (a) on the
charts of the model of 7.31a (b′); 6.7a on those charts; 6.9a without the further properties of its bundle; 7.17a in the
Siegel case; 7.31a in the marked form (b′); and 9.1 over number fields. 7.31a (a) applies a published theorem, cited
with it; the wider forms of the others are adaptations of published results or this roadmap's own formulations, as their
`*Origin:*` labels say.

**Corollaries of general theorems.** A section may carry, as a third line under these two labels,
`*Corollary of:*`, which names a general theorem and the roadmap section that states it, and the clauses it covers
when it does not cover the whole section. As long as that general theorem is not in the library, what the line
covers is proved as [FormalProof] proves it: the `*Method of the formal proof:*` label says how, and for which form
of the statement when that proof has a narrower one; the route given with the section is that proof's unless the
label says that it differs. Once the general theorem is in the library, the proof of what the line covers is
replaced by the deduction from it, and the lemmas that only the first proof uses are removed. The statement does
not change.

## Layer 6: Semi-abelian degenerations: Lie algebras, periods, conjugate data

The statements of this layer concern one semi-abelian scheme at a time: its Hodge metric near the boundary and the positivity of its Hodge bundle over curves in characteristic zero, its periods over a polydisc, and a substitute in characteristic `p` for the de Rham homology of an abelian scheme.

### 6.2a Seminegativity of the Lie algebra of a semi-abelian scheme over a curve

*Origin:* (b): adapted from Bost (2004), section 2.4 and Corollary 2.7, an algebraic proof that the Lie algebra of an
abelian variety over a curve in characteristic zero is seminegative, equivalently that its Hodge bundle is nef, a
statement classical by Hodge theory: here for a semi-abelian scheme with no hypothesis on its generic fibre. (a): this
roadmap's own formulation, for an arbitrary degeneration and polarisation, of two bounds that [FormalProof] has on the
charts of the model of 7.31a (b′) (*Scope*); for `det E` they give the logarithmic growth of the Faltings metric,
ArakelovGeometryAndAbelianHeights §5.3, after Faltings and Chai (1990).

*Method of the formal proof:* (b): over an algebraically closed field of characteristic zero, the bound for a subsheaf
of `Lie(G/C)` is reduced to line subbundles of its pull-backs to finite covers of the curve; for a line of positive
degree, the formal one-parameter subgroup of `G` tangent to it is at each place a rescaling of a path with integral
coefficients, the orders of the scaling factors add up to the degree, and a Hankel-determinant criterion with the
product formula on the curve makes the path rational; a rational path that satisfies the doubling law of a
one-parameter subgroup of a semi-abelian scheme is constant, so the line is zero, and the statement over `k` follows by
descent. Characteristic zero enters through the existence of the formal path with integral coefficients at every place
of the curve. (a): only in the form recorded under *Scope*, for a principal polarisation on the charts of the model of
7.31a (b′), where the Gram matrix comes from the logarithmic periods of 6.7a. [FormalProof]'s proof of (b) departs
from the proof by Hodge theory, written as the Route below, which uses the Griffiths semipositivity of the Hodge
metric on the abelian locus and the logarithmic growth (a) at the boundary.

Prove the following.

(a) (*logarithmic growth of the Hodge metric*) let `S̄` be a smooth complex variety, `D ⊂ S̄` a normal crossings divisor
and `G → S̄` a semi-abelian scheme that is abelian over `S = S̄ ∖ D`, with Hodge bundle `E = e^*Ω¹_{G/S̄}` of rank `g ≥ 1` (for
`g = 0`, `E = 0` with its unique metric and there is nothing to state), and let `λ` be a polarisation of `G|_S`. The *Hodge
metric* of `λ` on `E|_S` is
`h_λ(α, β) = c_λ·∫_{G_x} i·α ∧ β̄ ∧ c₁(λ)^{g−1}`, `c_λ = (2π·(g − 1)!·√(deg λ))^{−1}`, for invariant `1`-forms `α, β` on the
fibre `G_x`: with this constant `h_λ` is the hermitian form dual to the Hodge inner product `π·H_λ` on `Lie G_x`, `H_λ` the
Riemann form of `λ` (in an `H_λ`-orthonormal basis, `∫ iα ∧ ᾱ ∧ c₁(λ)^{g−1} = 2(g − 1)!·√(deg λ)·|α|²_{H_λ^{−1}}`, the volume of
`G_x` being `√(deg λ)`); on the Siegel family with a principal `λ`, `h_λ(dz_i, dz_j) = (Im τ)_{ij}/π`, and for `g = 1`,
`‖dz‖² = Im τ/π`. On the determinant, `det h_λ = π^{−g}·(deg λ)^{−1/2}·‖·‖²_Fal`, where `‖·‖_Fal` is the Faltings metric of
ArakelovGeometryAndAbelianHeights §2.8 (`‖dz₁ ∧ ⋯ ∧ dz_g‖²_Fal = det Im τ` on the Siegel family; for `g = 1`, `‖dz‖² = Im τ`);
equivalently `det h_λ = (deg λ)^{−1/2}·‖·‖²_Del` with Deligne's normalisation `‖α‖²_Del = (2π)^{−g}|∫α ∧ ᾱ|` of ArakelovGeometryAndAbelianHeights §2.1
(`‖·‖²_Del = π^{−g}‖·‖²_Fal`, ArakelovGeometryAndAbelianHeights §2.7). So for
a principal polarisation `h_λ` is Deligne's normalisation, and differs from Faltings' by the factor `π^{−g}` on `det E`. Then
near every point of `D`, in a frame of `E` on a polydisc
where `D = {x₁⋯x_a = 0}`, the Gram matrix `H` of `h_λ` satisfies `|H_{ij}| ≤ C·(1 + Σ_j|log|x_j||)` and `H ≥ c·Id` for
constants `C, c > 0`. Two polarisations give metrics that are comparable with constants on the polydisc, so these
estimates do not depend on `λ`. In particular `h_λ` satisfies condition (i) of SingularHermitianMetricsAndL2Methods §5.3 relative to the
extension `E`, and so does the quotient metric on every locally free quotient `Q` of `E` and on its determinant: the SQUARED
norm of a frame of `det Q` (the determinant of the Gram matrix of the quotient metric) lies between `c^{rk Q}` and
`C^{rk Q}(1 + Σ_j|log|x_j||)^{rk Q}`, so its norm lies between `c^{rk Q/2}` and `C^{rk Q/2}(1 + Σ_j|log|x_j||)^{rk Q/2}`; these
exponents cannot be lowered, as the identity quotient of the Hodge bundle of a product of two copies of a degenerating elliptic
family shows (Gram matrix `≍ diag(t, t)`, `t = −log|q|`: squared norm `≍ t²`, norm `≍ t`);

(b) let `k` be a field of characteristic zero, `C` a smooth projective geometrically connected curve over `k` and `G → C`
a semi-abelian scheme (ShimuraCompactifications §6.1). Then every locally free subsheaf of `Lie(G/C)` has
degree `≤ 0`; equivalently every locally free quotient of the Hodge bundle `E = e^*Ω¹_{G/C}` has degree `≥ 0` (`E` is
nef). The characteristic-zero hypothesis enters through the Hodge metric. (b) follows from [FormalProof],
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/SemiAbelianLieSeminegativeBis.lean`
(`GlobalTheory.Nef.semiAbelianLieSeminegative`), of the statement
`Development/AbelianVarietyTheory/PublishedTheorems/Divisors₂/InterNumDetNonposSplitTorus.lean`
(`GlobalTheory.Published.SemiAbelianLieSeminegative`). For `Q = E`, `deg E = deg ω ≥ 0` holds over an
algebraically closed field of every characteristic by ShimuraCompactifications §7.33 (a Hodge line of degree `≤ 0` on a
smooth proper curve has degree `0`; for a principally polarised abelian generic fibre,
ArakelovGeometryAndAbelianHeights §5.0b); (b) extends this to every locally free quotient of `E` in characteristic zero.

*Scope.* (a) bounds the entries of the Gram matrix of `h_λ` and the Gram matrix from below, in frames of the extension `E`,
over a smooth complex variety with a normal crossings divisor; it asserts nothing about derivatives of `H` (condition (ii) of
SingularHermitianMetricsAndL2Methods §5.3). [FormalProof] has, for a principal polarisation on the charts of the model of
7.31a (b′) with their logarithmic periods (6.7a), the same two bounds, in the form `c·Id ≤ Γ^{−1} ≤ C·(e + Σ_{i≤a} log(1/|x_i|²))·Id`
(`e = exp(1)`) for the Gram matrix `Γ` of the Hodge form `π·H_λ` in a holomorphic frame of the Lie algebra (for a frame of
the whole Lie algebra `Γ^{−1}` is the Gram matrix of `h_λ` in the dual frame of `E`), together with the bound
`C·exp((e + Σ_{i≤a} log(1/|x_i|²))/2)` for the first derivatives of the entries of `Γ`
(`GlobalTheory.T.period_gram_comparison_bound`, in `Development/AutomorphicSpectrum/Proofs/GeometryProofs/PeriodGramComparisonBoundStatement.lean`;
on the compactified model, the field `logBound` of `GroundTheory.Heights₂.Heights.LowerBoundFree.HermMetric`, in
`GroundTheory/HeightsAndTheta/Heights/HodgeLowerBound/CoordinateIdeals.lean`). The normalisation of `h_λ` (the dual
of `π·H_λ`) is that of [FormalProof], `Development/AutomorphicSpectrum/Definitions/GlobalGeometry/IsHodgeGram.lean`
(`GlobalTheory.CompanionTheory.Ar.Fl.IsHodgeGram`), `Development/AutomorphicSpectrum/Proofs/GeometryProofs/ContDiffUncentre.lean`
(`GlobalTheory.CompanionTheory.Ar.HodgeMetric.periodGram`). The rest of (a) (an arbitrary degeneration and
polarisation, the comparison of two polarisations, the determinant identities, the quotient metrics and the sharpness of
their exponents) is this roadmap's own statement and not a step of [FormalProof]. For `Q = E` the bounds on the norm
of a frame of `det E` give, through `det h_λ = π^{−g}(deg λ)^{−1/2}‖·‖²_Fal`, ArakelovGeometryAndAbelianHeights §5.3 (the
Faltings metric on `ω = det E` has logarithmic singularities along `D`) with the exponent made explicit; (a) extends that
statement from `det E` to `E` and its quotients. (b) is the statement of [FormalProof]
`GlobalTheory.Published.SemiAbelianLieSeminegative` (in `Development/AbelianVarietyTheory/PublishedTheorems/Divisors₂/InterNumDetNonposSplitTorus.lean`,
proved as `GlobalTheory.Nef.semiAbelianLieSeminegative`), with the same hypotheses. (b) has no hypothesis on the generic
fibre: for a curve `C` mapping to a base `S̄` carrying `G` as in (a), it applies to the pull-back of `G` whether or not the
image of `C` meets the open set where `G` is abelian, the curves inside a boundary stratum of positive toric rank of a
toroidal compactification included (the pull-back to such a curve, or to its normalisation, has a nontrivial torus at the
generic point; fourth Check). Nothing is asserted in positive or mixed characteristic; in positive characteristic the case
`Q = E` is ShimuraCompactifications §7.33.

*Route.* (a) Use the degeneration data near a boundary point (ShimuraCompactifications §§6.4–6.7). The periods live on the complement of `D` only (ShimuraCompactifications §6.4:
there is no map from the period lattice to the torus extension over `D`): over `P ∖ D`, `P` the polydisc of the statement, and
only there, the fibres of `G` are analytically the quotients of the fibres of an extension of an abelian scheme by a torus by a
period lattice with bilinear form `∏_j x_j^{s_j}`, `s_j` positive semidefinite (for the Tate family the period `q` is a point of
`G_m` for `q ≠ 0`, while `q = 0` is not a point of `G_m`, so `G_m/q^ℤ` makes sense only off the boundary). The metric `h_λ` is defined only on `P ∖ D` and is computed there, in the frame of
invariant differentials of the torus extension and its abelian part; this frame is the restriction to `P ∖ D` of a frame of
`E` over `P` (the completions of `G` and of the torus extension along the unit section agree, ShimuraCompactifications §§6.5–6.7, so the invariant
differentials of the torus extension are a frame of `E = e^*Ω¹_{G/S̄}` on `P`; at a modular cusp this is the differential `du/u`
of the Check of ShimuraCompactifications §6.7), and the estimates below are for the Gram matrix in this extended frame, hence, up to a holomorphic change of
frame on `P`, in every frame of `E`. In it, `H` is comparable on `P ∖ D` to `B(x) + Σ_j(−log|x_j|)s_j` with `B` bounded and the polarisation uniformly
positive on the common null space of the `s_j` (the computation in the proof of ArakelovGeometryAndAbelianHeights §5.3,
after Deligne and Faltings–Chai). The entries are then `O(1 + Σ_j|log|x_j||)`. For the lower bound, decompose along the
common null space `N` of the `s_j` and its orthogonal, on which `Σ_js_j` is positive definite: as `B` is bounded and uniformly
positive on `N`, the Schur complement of the `N`-block of `B(x) + M·Σ_js_j` is uniformly positive definite for one large
constant `M`, so `B(x) + M·Σ_js_j ≥ 2c·Id` for all `x`; then shrink the polydisc until `−log|x_j| ≥ M` for every `j`, so that
`Σ_j(−log|x_j|)s_j ≥ M·Σ_js_j` and `H ≥ c·Id` (after adjusting `c` by the comparability constant). The constant `log 2`, the
lower bound of `−log|x_j|` on the polydisc of radius `1/2`, does not suffice in place of `M`: for the Tate parameter `q = 4x` the
scalar model is `−log|x| − log 4`, and the bound `B + log 2 = −log 2` is negative, however far the disc is shrunk. For a second
polarisation `λ′` the forms `s_j` are replaced by forms with the same null spaces (the kernels of the monodromy
logarithms) and `B` by a bounded form positive on the same common null space, so the two Gram matrices are comparable;
the determinant of `h_λ` is computed in linear coordinates `z` on `Lie G_x`: the Gram matrix of `h_λ` in the basis `dz_j` is
the inverse of that of `π·H_λ`, so `dz₁ ∧ ⋯ ∧ dz_g` has squared norm `π^{−g}/det H_λ` for `det h_λ`, while the covolume of the period lattice is
`√(deg λ)` for the euclidean structure `Re H_λ` and hence `√(deg λ)/det H_λ` for Lebesgue measure in `z`, which is
`‖dz₁ ∧ ⋯ ∧ dz_g‖²_Fal` (ArakelovGeometryAndAbelianHeights §§2.1–2.2: `‖ω‖²_Fal = 2^{−g}·i^{g²}∫ ω ∧ ω̄` for the top form `ω = α₁ ∧ ⋯ ∧ α_g`); this gives
`det h_λ = π^{−g}(deg λ)^{−1/2}‖·‖²_Fal`. For a locally free quotient `Q` of `E`, take a holomorphic frame of `E` whose first vectors span the
kernel; in the image frame of `Q` the Gram matrix of the quotient metric is the Schur complement of that block of `H`,
again `O(1 + Σ_j|log|x_j||)` and `≥ c·Id`, and its determinant, the squared norm of the frame of `det Q`, lies between
`c^{rk Q}` (from the lower bound) and `C^{rk Q}(1 + Σ_j|log|x_j||)^{rk Q}` (Hadamard's inequality: the determinant of a positive
definite matrix is at most the product of its diagonal entries). (b) Reduce to `k = ℂ` (Lefschetz principle: the statement descends to a finitely
generated field of definition). For a generic fibre that is not abelian one more step is needed: the Lie algebra is an
extension of that of the abelian part by that of a torus with finite monodromy; this step is not written out here
([FormalProof] proves (b) for every semi-abelian `G` over an algebraically closed field of characteristic zero by another
route, `GlobalTheory.T.lieSheaf_semiAbelian_semiNeg_of_isAlgClosed`, and descends it to `k`), and what follows treats an
abelian generic fibre. Let `U ⊂ C` be the open set where `G` is abelian; a polarisation `λ` of the generic fibre
extends over `U` (extension of homomorphisms of abelian schemes over a normal base, ArakelovGeometryAndAbelianHeights
§2.0). On `U` the Hodge metric `h_λ` is Griffiths semipositive. The flat structure: by AbelianSchemesAndArithmeticModuli
A4.3 and A5.6, `V = H¹_dR(G_U/U) ⊗ O_U^{an} = R¹π_*ℂ ⊗ O_U^{an}` with the Gauss–Manin connection `∇` is a flat holomorphic
bundle whose flat sections form the Betti local system, and the Hodge filtration `E = ω_{G_U} = F¹ ⊂ V` is a holomorphic
sub-bundle; the class `c₁(λ)` is flat, so `k(u, v) = c_λ·∫_{G_x} i·u ∧ v̄ ∧ c₁(λ)^{g−1}` on `H¹(G_x, ℂ)` is a `∇`-parallel
nondegenerate hermitian form. It equals `h_λ` on `E = H^{1,0}`, is negative definite on `H^{0,1} = Ē` (`k(ᾱ, ᾱ) = −k(α, α)`;
positivity of the Riemann form, AbelianSchemesAndArithmeticModuli A5.2), and `H^{0,1}` is the `k`-orthogonal of `E` (the integrand of `k(α, β̄)` has type
`(g + 1, g − 1)`). SingularHermitianMetricsAndL2Methods §3.2a(b) then gives `θ_E(ξ ⊗ v) = |σ(ξ)v|² ≥ 0`, `σ` the second
fundamental form (the Kodaira–Spencer map of PELModuli M2.10, which agrees with the Gauss–Manin description of
AbelianSchemesAndArithmeticModuli A4.3), and SingularHermitianMetricsAndL2Methods §3.2a (a) gives Griffiths semipositivity of every locally free quotient with
its quotient metric. For a locally free quotient `Q` of `E` of rank `q ≥ 1`, the
determinant of the quotient metric on `det Q` has `c₁ ≥ 0` on `U` (the trace of a Griffiths semipositive curvature), and by
(a) the squared norm of a frame satisfies condition (ii) of SingularHermitianMetricsAndL2Methods §2.5 at the punctures (with
`m = q`: `|log|e|²| ≤ q·log(1 + log(1/|z|)) + C`); SingularHermitianMetricsAndL2Methods §2.5, whose integrability hypothesis is automatic for semipositive curvature, gives
`deg Q = deg det Q = ∫_U c₁(det Q, det h_Q) ≥ 0`. For a locally free subsheaf `F ⊂ Lie(G/C) = E^∨`, its saturation `F′` has
`deg F ≤ deg F′`, and `F′^∨` is a locally free quotient of `E`, so `deg F ≤ −deg F′^∨ ≤ 0`.

*Needs:* ShimuraCompactifications §§6.1, 6.2, 6.4–6.7; ArakelovGeometryAndAbelianHeights §§2.0, 2.1, 2.2, 2.7, 2.8, 5.3; AbelianSchemesAndArithmeticModuli A4.3,
A5.2, A5.6 (de Rham cohomology with its Hodge filtration and Gauss–Manin connection, Riemann forms, the comparison with the
Betti local system); PELModuli M2.10 (the Kodaira–Spencer map); SingularHermitianMetricsAndL2Methods §§2.5, 3.2a, 5.3.

**Checks.**

- The universal generalised elliptic curve over `X(N)`, `N ≥ 3`: `E = ω` has positive degree; a constant abelian
  scheme has `E` trivial, of degree zero, and its locally free quotients, being globally generated, have degree `≥ 0`, not
  always `0`: over `ℙ¹` a constant abelian surface has `E = O²`, which maps onto `O(1)` by the homogeneous coordinates.
- `G = E₀ × E_t` (a constant elliptic curve times a degenerating family over `ℙ¹`): `E = O ⊕ ω_t`, both summands
  of degree `≥ 0`; a quotient `O` of degree zero exists, so `E` is nef and not ample.
- For `g ≥ 2` the formula `i^{g²}∫ ω ∧ ω̄` defines a metric on `det E` only: for a `1`-form `α`, `α ∧ ᾱ` is a `2`-form and
  cannot be integrated over the `g`-dimensional fibre; the factor `c₁(λ)^{g−1}` is what makes `h_λ` a metric on `E`.
- Boundary curves. On `X(N) × X(N)`, `N ≥ 3`, with `G` the product of the two universal generalised elliptic
  curves (identity components of their smooth loci), the boundary curve `{c} × X(N)`, `c` a cusp, carries `G_m × E`, whose
  generic fibre is not abelian; (b) applies to it, and its Hodge bundle `O ⊕ ω` is nef, as (b) asserts.

### 6.7a Logarithmic periods of a semi-abelian scheme over a polydisc

*Origin:* adapted from Faltings and Chai (1990), chapters II–III and chapter V, proof of Proposition 4.5, and Deligne
(1985), Lemme 1.18: the periods of a degenerating family over a polydisc, in the multiplicative form of the principal
Siegel degeneration charts (ArakelovGeometryAndAbelianHeights §5.0a), and, over a punctured disc, the
monodromy-invariant sublattice that extends across the boundary (ArakelovGeometryAndAbelianHeights §5.3); here (a)–(e)
for an arbitrary `(G, ℒ)` over a ring with holomorphic points `ψ_u`, on the logarithmic cover of `𝔻^n_a`, with the
kernel clause of (b).

*Method of the formal proof:* a holomorphic family of exponential maps of the fibres is taken near `u = 0`; the kernel
at `u = 0` is discrete, free and spans `ℂ^g`, and its elements continue holomorphically to periods of the nearby
fibres, which gives `W`; on `𝔻^n_a` the kernels are lattices of rank `2g` with holomorphic local frames, from which the
flat frame `P` on the logarithmic cover, the monodromy `T_i` and the Riemann relation of (c) are assembled; that `W` is
co-isotropic comes from the continuity of the Weil pairing on torsion points along the sections of `W` and a count of
ranks.

Let `0 ≤ a ≤ n`, `𝔻^n` the open unit polydisc and `𝔻^n_a ⊂ 𝔻^n` the points with `u_1 ⋯ u_a ≠ 0`. Let `R` be a ring with ring homomorphisms `ψ_u : R → ℂ` (`u ∈ 𝔻^n`) such that `u ↦ ψ_u(r)` is holomorphic for every `r ∈ R` (for instance the ring of functions holomorphic near the closed polydisc). Let `G → Spec R` be a semi-abelian scheme of relative dimension `g` with a trivialisation `Lie(G) ≅ R^g`, and `ℒ` a rigidified symmetric line bundle on `G`, such that over an open subscheme of `Spec R` containing the points `ψ_u`, `u ∈ 𝔻^n_a`, `G` is abelian and `ℒ` is relatively ample with `K(ℒ)` trivial. Prove that there are `0 < ρ ≤ 1` and:

- (a) a free `ℤ`-module `Λ` of rank `2g` with a unimodular alternating form `E`;
- (b) additive maps `P(w) : Λ → ℂ^g`, holomorphic in `w` on the logarithmic cover of `𝔻^n_a` (`u_i = e^{w_i}` for `i ≤ a`, `u_i = w_i` for `i > a`), such that for every `w`, with `u` its image in `𝔻^n_a`, `P(w)(Λ)` is the kernel of the exponential map `ℂ^g → G(ψ_{ρu})` of the fibre at `ψ_{ρu}`, in the given frame of the Lie algebra: the period lattice of that fibre;
- (c) positive definite Hermitian matrices `H(u)`, `u ∈ 𝔻^n_a`, with `Im(P(w)x · H(u) · (P(w)y)^*) = E(x, y)`, such that `π·H(u)` is the matrix, in the given frame of the Lie algebra, of the Hodge form of the polarisation of the abelian variety at `ψ_{ρu}` defined by `ℒ` (so `H(u)` is the Riemann form of `ℒ` there);
- (d) endomorphisms `T_i` of `Λ` (`i ≤ a`) with `P(w + 2πi·e_i) = P(w)∘T_i`;
- (e) a subgroup `W ⊂ Λ` containing a nonzero multiple of every element orthogonal to `W`, such that for `x ∈ W` the vector `P(w)x` depends only on `u`, extends holomorphically to `𝔻^n`, and the values at `u = 0` span `ℂ^g`.

*The form of the formal proof.* [FormalProof], `Development/AutomorphicSpectrum/Proofs/GeometryProofs/LogPeriodsRiemannFormStatement.lean` (`GlobalTheory.T.log_periods_riemann_form`), `Development/AutomorphicSpectrum/Definitions/MetricPeriods/ClopenCondOnto.lean` (`GlobalTheory.CompanionTheory.Ar.Flat.LogPeriods`), `Development/AutomorphicSpectrum/Definitions/GlobalGeometry/BdryChart.lean` (`GlobalTheory.CompanionTheory.Ar.Flat.BdryChart.IsRiem`), has this statement for the charts of the moduli scheme of 7.31a (b′) (`GlobalTheory.T.boundary_chart_log_period_family`, in `Development/AutomorphicSpectrum/Proofs/GeometryProofs/BoundaryChartLogPeriodFamilyStatement.lean`; the chart is the structure `GlobalTheory.CompanionTheory.Ar.Flat.BdryChart` and the data (a)–(e) the structure `GlobalTheory.CompanionTheory.Ar.Flat.LogPeriods`): `G` carries the action of `𝒪_E` and `ℒ` its cubical structure, with the isomorphisms of 7.31a (b′) (ii), the restriction of `(G, ℒ)` to the open subscheme is the pull-back of the universal marked object by a morphism to `Sh`, and the points `ψ_u`, `u ∈ 𝔻^n_a`, map to complex points of `Sh` over an embedding in `ℂ` of its base field (7.31a (b′) (i)). The kernel clause of (b) is part of it, through a holomorphic family of exponential maps of the fibres over the polydisc of radius `ρ`. The statement for an arbitrary `(G, ℒ)` is this roadmap's own. On the principal Siegel charts the multiplicative form of these periods is ArakelovGeometryAndAbelianHeights §5.0a, and (e) in one variable is the monodromy-invariant sublattice of ArakelovGeometryAndAbelianHeights §5.3.

*Route.* Near `u = 0` there is a holomorphic family of exponential maps `ℂ^g → G(ψ_u)`. The kernel at `u = 0` is discrete and free, and spans `ℂ^g` because the fibre is an extension of an abelian variety by a torus; each of its elements continues to a holomorphic section of the kernels: this gives `W`. On `𝔻^n_a` the kernels form a local system of lattices of rank `2g` (AbelianSchemesAndArithmeticModuli A5.6) carrying the Riemann form (AbelianSchemesAndArithmeticModuli A5.2) of the principal polarisation; a flat frame on the logarithmic cover is `P`, the monodromy around `u_i = 0` is `T_i`, and `W` is co-isotropic by a count of ranks. The degeneration data near `u = 0` are those of ShimuraCompactifications §§6.4–6.7. The proofs of these steps (the family of exponential maps, the discreteness of the kernel at `u = 0` and the continuation of its elements, and the assembly of the local system with its monodromy) are not given here.

*Needs:* ShimuraCompactifications §§6.1, 6.4–6.7; AbelianSchemesAndArithmeticModuli A5.2, A5.6.

**Checks.**

- The Tate curve over the disc, `q = u`, with `ρ = 1` and the frame of the Lie algebra in which the exponential map of the fibre at `u ≠ 0` is `z ↦ e^{2πiz}` from `ℂ` to `ℂ^×/q^ℤ`: `Λ = ℤ²`, `P(w) = (1, w/2πi)`, whose image `ℤ + τℤ`, `τ = w/2πi`, is the kernel of that map, `H = 2π/log(1/|u|)`, `T = (1 1; 0 1)`, `W` spanned by the first basis vector, with constant period `1`. For real `b ∉ ℤ` and `γ = (1 b; 0 1)`, the maps `P(w)∘γ` (with `P(w)` extended `ℝ`-linearly) satisfy (c), (d) and (e) with the same `H`, `T` and `W`, since `γ` preserves `E`, commutes with `T` and fixes the first basis vector; their image `ℤ + (τ + b)ℤ` is not the period lattice, and only the kernel clause of (b) excludes them.

### 6.9a Conjugate data on a curve in characteristic p

*Origin:* adapted from Goldring and Koskivirta (2015), sections 6.1.2–6.1.4 and Theorem 6.2.1, and Ekedahl and van der
Geer (2004), the Hodge and conjugate filtrations of the canonical extension of the de Rham bundle over toroidal
compactifications at good reduction (for Shimura varieties of Hodge type at hyperspecial level, and in the Siegel case):
here a bundle `H` of rank `2g` with the exact sequences (a) and (b) on a smooth projective curve in characteristic `p`
mapping to `X_0`, for a semi-abelian scheme `G_0` with a cubical line bundle `L_0` and an action of `O` over any reduced
locally noetherian `X_0`, the bad primes of the global model of 7.12a included.

*Method of the formal proof:* in a formal chart along the unit section the bundle is `Lie ⊕ ω`; the map `α` from
`Fr^*Lie` has as components the linear part of the Verschiebung and the matrix of the coefficients of `x^py` in the
first power map of `Λ(L_0)`, `β` is its adjoint for an explicit pairing, changes of chart preserve these data and glue
the lattices along the curve, and exactness follows from `β∘α = 0` (the symmetry and interchange laws) and from the
injectivity of `α` on the closed fibres (Cartier's criterion) by a splitting lemma over a local ring. The same formal
charts serve at semi-abelian fibres and at the bad primes of the global model. The closest published relative of this
construction is the theory of theta functions in characteristic `p` of Cristante (1980) and of Candilera and Cristante
(1983).

Prove the following. Let `X_0` be a reduced locally noetherian scheme and `G_0 → X_0` a semi-abelian scheme of relative dimension `g`, abelian at the generic points of `X_0`, with a rigidified symmetric line bundle `L_0` carrying a cubical structure, and with an action of `O = 𝒪_E`, for `E` and `w_0` as in the Conventions (CM data), the involution `a ↦ ā` being complex conjugation, such that `(a × 1)^*Λ(L_0) ≅ (1 × ā)^*Λ(L_0)` for every `a ∈ O`, and with an isomorphism `L_0 ≅ (1, w_0)^*Λ(L_0)`, the pull-back by `x ↦ (x, w_0x)`. Let `p` be a prime, `C` a smooth projective curve over a field of characteristic `p`, `f : C → X_0` a morphism, `G = f^*G_0`, `Lie = Lie(G)`, `ω = Lie^∨`. Assume that at every closed point of `C` the geometric fibre of `G` is an extension `0 → T → G_s → B → 0` of an abelian variety by a torus on which `L_0` is the pull-back of a line bundle `M` on `B` with `K(M)` trivial. Then there are a vector bundle `H` on `C` of rank `2g` with an action of `O`, and exact sequences of vector bundles (a) `0 → ω → H → Lie → 0` and (b) `0 → Fr^*Lie →α H →β Fr^*ω → 0`, `O`-equivariant for the dual action composed with the involution on `ω`. This follows from [FormalProof], `Development/AutomorphicSpectrum/Proofs/GeometryProofs/CurveLieEigenDegreeStatement.lean` (`GlobalTheory.T.curve_lie_eigen_degree`), `Development/AutomorphicSpectrum/Definitions/CommutativeAlgebra/IsSplitGaussChars.lean` (`GlobalTheory.CompanionTheory.Ar.Crv.ConjData`), `Development/AutomorphicSpectrum/Definitions/GlobalGeometry/ToFirst.lean` (`GlobalTheory.CompanionTheory.Ar.Conj.PowFns`). The bundle constructed in the Route has moreover a perfect skew-symmetric pairing for which both subs are Lagrangian and `β` is the adjoint of `α`, and the composite `Fr^*Lie → H → Lie` is the differential of the Verschiebung (dual to the pull-back `V^* : ω → Fr^*ω` of invariant differentials of ShimuraCompactifications §6.15). In coordinates of the formal completion along the unit section and a formal frame of `L_0`: `H = Lie ⊕ ω`, `α = (dV, a^T)` with `a` the coefficient of `x^py` in the trivialisation of `Λ(L_0)_{[p]x,y} ⊗ Λ(L_0)_{x,y}^{−p}` given by the first partial group law; a change of coordinates `φ` and of the trivialisation of `Λ(L_0)` by a unit `λ(x, y)` acts by `(y_1, y_2) ↦ (dφ·y_1, (dφ^{−1})^T(y_2 + Λ^Ty_1))`, `Λ` the matrix of the terms `x_iy_j` of `λ`. These properties are not part of the theorem of [FormalProof] cited above, whose conclusion consists of `H`, the action and the two exact sequences. In [FormalProof] they are statements about the local model of `H` in one formal chart: the pairing is given there by an explicit formula, `β` is its adjoint of `α`, `β∘α = 0`, a change of chart preserves the pairing and carries `α`, `β` to one another, and multiplication by `p` factors as `V∘Fr` with the linear part of `V` equal to the first component of `α` ([FormalProof], `Development/AutomorphicSpectrum/Proofs/AlgebraProofs/AlphaBetaAdjointExact.lean` (`GlobalTheory.CompanionTheory.Ar.Conj.Isotropy.beta_comp_alpha`), `Development/AutomorphicSpectrum/Definitions/CommutativeAlgebra/GermComp1ZeroPointLeft.lean` (`GlobalTheory.CompanionTheory.Ar.Conj.dotProduct_beta`), `Development/AutomorphicSpectrum/Proofs/AlgebraProofs/FormalIsomorphismTransportStatement.lean` (`GlobalTheory.T.formal_isomorphism_transport`), `Development/AutomorphicSpectrum/Proofs/AlgebraProofs/MultiplicationByPFactorsFrobeniusStatement.lean` (`GlobalTheory.T.multiplication_by_p_factors_frobenius`)). The bundle of the Route has the properties listed because these statements hold in every chart and are compatible with the changes of chart. What [FormalProof] states of the symmetry of the pairing is that the matrix `S` of the terms `x_iy_j` of the symmetry series satisfies `S^T = −S` ([FormalProof], `Development/AutomorphicSpectrum/Proofs/AlgebraProofs/FormalHermitianActionPairingStatement.lean` (`GlobalTheory.T.formal_hermitian_action_pairing`), `Development/WeilBound/CoreStatements/HodgeTatePoints/BilinearPartAx3.lean` (`PositivityTheory.HtPt.Ca.bil_sy_skew`)). For a principally polarised abelian scheme over `C`, `H` may be taken to be the de Rham homology with its Hodge and conjugate filtrations; this comparison is this roadmap's own statement and not a step of [FormalProof]. `H` is not asserted to be canonical.

*The form of the formal proof.* [FormalProof] states this as `GlobalTheory.T.curve_lie_eigen_degree` (in `Development/AutomorphicSpectrum/Proofs/GeometryProofs/CurveLieEigenDegreeStatement.lean`), with `H`, the action and the two exact sequences recorded in the structure `GlobalTheory.CompanionTheory.Ar.Crv.ConjData` (in `Development/AutomorphicSpectrum/Definitions/CommutativeAlgebra/IsSplitGaussChars.lean`). There the curve is a field of characteristic `p` with a family of discrete valuations and weights satisfying the product formula (for a smooth projective curve, its function field with the valuations and degrees of its closed points), the vector bundles are lattices in the generic fibre, and in place of "reduced, locally noetherian, abelian at the generic points" it asks that the functions on the fibre powers of `G_0` come from `X_0`, which those three hypotheses imply (`GlobalTheory.T.powFns_of_abelian_generic`). The pairing and the identification of `Fr^*Lie → H → Lie` with the differential of the Verschiebung are not part of that form.

*Route.* (1) Near a point of `X_0` choose formal coordinates and a formal frame of `L_0`: a formal group law, the action, the two partial laws of `Λ(L_0)`, the symmetry and the adjunction series; their identities hold because a unit on the fibre cube of `G_0` that is `1` along the unit sections is `1` (functions on fibre powers come from the base, the generic fibres being abelian); two choices differ by a change of coordinates and of frame. (2) `H`, the pairing and the action for one choice at the generic point of `C`; at a closed point the lattice is the image of the standard lattice of a choice over the local ring. (3) The first power map is a function of `(x^{(p)}, y)` (its derivative in `x` vanishes), `[p] = V∘Fr`. (4) Isotropy: the symmetry law gives `b = Sh + a^T` for the coefficient `b` of `xy^p` in the second power map, the interchange law gives `ah = h^Tb` (`h = dV`), so `β∘α = 0`. (5) Over a local ring, a map `𝒪^g → 𝒪^{2g}` that is isotropic and injective on the closed fibre is a split injection onto a Lagrangian summand. (6) Injectivity on a geometric fibre (Cartier's criterion): if `α(w^{(p)}) = 0`, the jet `tw` of order `p` is killed by `p`, and the coefficient of `t^p` in the canonical generator of `(t_{tw}^*L ⊗ L^{−1})^{⊗p}` has zero differential, hence is a `p`-th power on the normal fibre; the top coefficients in two charts differ by the `p`-th power of the first-order transition function, so `t_w^*L ≅ L` to first order; this descends to `B`, where `K(M)` trivial gives that `w` is tangent to the torus, and there the `p`-th power of the jet is `w^{(p)}t^p ≠ 0`.

*Needs:* ShimuraCompactifications §§6.1, 6.15, 6.18 (semi-abelian schemes; the Verschiebung on invariant differentials; Frobenius and Verschiebung of commutative group schemes).

**Checks.**

- The chart formulas alone, with `g = 1` and without the action of `O`. These two cases are not instances of 6.9a: `𝒪_E`
  has rank at least `4` over `ℤ` (the CM data exclude an imaginary quadratic `E`, which is ramified over `ℚ`), so it admits
  no ring homomorphism to `End(𝔾_m) = ℤ` or to the endomorphism ring of an elliptic curve, whose commutative subrings have
  rank at most `2`; and a constant `𝔾_m` is not abelian at the generic points. For `G = 𝔾_m` (`V = 1`): `H = 𝒪²`,
  `α = (1, 0)`, `β = (0, 1)`. For a supersingular elliptic curve with a principal `L_0`: `dV = 0`, `α = (0, a)`, `a ≠ 0`.
- `L_0` trivial on an abelian variety: `a = 0`, and `α` is not injective at a non-ordinary point.

### Examples

From the Checks of 6.2a: over the modular curve `X(N)`, `N ≥ 3`, the Hodge bundle `ω` of the universal generalised elliptic curve has positive degree; a constant abelian scheme has trivial Hodge bundle, whose locally free quotients have degree `≥ 0` but not always `0` (over `ℙ¹` a constant abelian surface has `E = O²`, which maps onto `O(1)`); for `G = E₀ × E_t`, a constant elliptic curve times a degenerating family over `ℙ¹`, `E = O ⊕ ω_t` is nef and not ample. On `X(N) × X(N)` the boundary curve `{c} × X(N)` carries `G_m × E`, whose generic fibre is not abelian; 6.2a (b) applies to it, and its Hodge bundle `O ⊕ ω` is nef. From the Check of 6.7a: for the Tate curve over the disc with `q = u`, `Λ = ℤ²`, `P(w) = (1, w/2πi)`, `H = 2π/log(1/|u|)`, the monodromy is `T = (1 1; 0 1)`, and `W` is spanned by the first basis vector, with constant period `1`; `P(w)(Λ) = ℤ + (w/2πi)ℤ` is the period lattice, while `P(w)∘γ` with `γ = (1 b; 0 1)`, `b` real and not an integer, satisfies (c)–(e) of 6.7a and not the kernel clause of (b). From the Checks of 6.9a, in the chart formulas with `g = 1` and without the action (neither case is an instance of 6.9a, as `𝒪_E` acts on neither): for `G = 𝔾_m`, `H = 𝒪²` with `α = (1, 0)` and `β = (0, 1)`; for a supersingular elliptic curve `dV = 0` and `α = (0, a)` with `a ≠ 0`; for `L_0` trivial on an abelian variety `a = 0`, and `α` is not injective at a non-ordinary point.

### Dependencies

ShimuraCompactifications §§6.1, 6.2, 6.4–6.7, 6.15, 6.18; ArakelovGeometryAndAbelianHeights §§2.0, 2.1, 2.2, 2.7, 2.8, 5.0a, 5.3; AbelianSchemesAndArithmeticModuli §§A4.3, A5.2, A5.6; PELModuli §M2.10; SingularHermitianMetricsAndL2Methods §§2.5, 3.2a, 5.3.

## Layer 7: Global normal projective models and twisted Hodge lines

The statements of this layer concern the integral models of PEL-type Shimura varieties and their compactifications: the hypotheses of 6.9a on them, ample line bundles on the projective toroidal models, and normal projective models over the whole ring of integers of a number field.

### 7.12a The hypotheses of 6.9a on the global model and on the schemes over it

*Origin:* adapted from Faltings and Chai (1990), the degeneration data of a semi-abelian scheme over a complete
discrete valuation ring (its Raynaud extension and the line bundle on its abelian part): here the hypotheses of 6.9a,
verified on the global model of 7.31a (b′) and on every reduced locally noetherian scheme over it whose generic points
map to `Sh_F`, at every prime.

*Method of the formal proof:* functions on the fibre powers of `G` come from the base because the generic fibres are
abelian and the base is reduced; the fibre condition is invariant under pull-back, so it is checked on a local model
that the global model dominates, where the local ring of the point is dominated by a complete discrete valuation ring
of characteristic zero over which the semi-abelian scheme is uniformised, and the Raynaud extension, the line bundle
`M` on its abelian part and the triviality of `K(M)` are read off the uniformisation on the closed fibre.

In the setting of 7.31a (b′), with `O = 𝒪_E` and `w_0 = (1 + √−d)/2`, and with `M/ℓ^{v_ℓ(M)} ≥ 3` for every prime `ℓ` (the
hypothesis of (b′) (ii)), prove that the scheme `Y` of 7.31a (b′) (ii), with its `G` and `ℒ_G`, can be chosen so that the following holds. For `X_0 = Y`, and for every reduced locally noetherian scheme `X_0 → Y` whose generic points map to `Sh_F`, with `G_0`, `L_0` the pull-backs of `G`, `ℒ_G`, the hypotheses of 6.9a hold: `G_0` is semi-abelian and abelian at the generic points; `L_0` is rigidified, symmetric, cubical, with `(a × 1)^*Λ(L_0) ≅ (1 × ā)^*Λ(L_0)` and `L_0 ≅ (1, w_0)^*Λ(L_0)`; and at every point `z` of `X_0` of positive residue characteristic, for every prime, the geometric fibre is an extension `0 → T → G_{z̄} →q B → 0` of an abelian variety by a torus with `L_0|_{G_{z̄}} ≅ q^*M` for a line bundle `M` on `B` with `K(M)` trivial. In particular 6.9a applies to every morphism from a smooth projective curve in characteristic `p` to `X_0`, the curves in the boundary included.

*The form of the formal proof.* [FormalProof] has, for a global model dominating at every prime local models whose toric fibres split after a finite separable extension of the residue field and whose pull-backs to complete noetherian normal local domains of characteristic zero are uniformised (the local models of the Route), at a level good at every prime, that functions on the fibre powers of `G` come from `Y` and that the fibre condition holds at every point of positive residue characteristic (`GlobalTheory.T.global_model_power_free`, in `Development/AutomorphicSpectrum/Proofs/GeometryProofs/GlobalModelPowerFreeStatement.lean`), and that the fibre condition is invariant under pull-back (`GlobalTheory.T.fibre_power_free_pullback`, in the same folder); the passage to every reduced locally noetherian `X_0 → Y` combines these with `GlobalTheory.T.powFns_of_abelian_generic` (6.9a).

*Route.* The bundle and its isomorphisms: 7.31a (b′). The model `Y` is chosen to dominate, at every prime, a local model whose toric fibres split after a finite separable extension of the residue field and whose pull-backs to complete noetherian normal local domains of characteristic zero with abelian generic point and split closed fibre have degeneration data; the existence of such local models and of a global model dominating them is part of the statement of [FormalProof] behind 7.31a (b′), and is not given here. The fibres: the condition is invariant under pull-back, so let `X_0 = Y`. Dominate the local ring of `z` by a complete discrete valuation ring `R` of characteristic zero whose generic point maps to `Sh_F`, with split closed fibre after a finite extension. The pull-back of `(G, ℒ_G)` to `R` has degeneration data (ShimuraCompactifications §§6.4–6.6): a Raynaud extension `0 → T → G̃ → B_R → 0` with the same closed fibre as `G`, on which the line bundle is the pull-back of an ample `M_R` on `B_R`; the polarisation of the generic fibre being principal, `K(M_R)` is trivial. Restrict to the closed fibre. The proofs that the fibre condition is invariant under pull-back and that the closed fibre of a uniformised semi-abelian scheme has this form are not given here, nor is the uniformisation of the pull-back at the primes that are bad for the datum and the level.

*Needs:* 6.9a, 7.31a (b′) (the cubical line bundle `ℒ_G`); ShimuraCompactifications §§6.4–6.6.

### 7.17a Ampleness of twisted Hodge lines on projective toroidal models

*Origin:* adapted from Lan (2016), Propositions 6.1 and 6.4, and Lan (2017), Theorem 6.1, the projective toroidal
models as normalised blow-ups of minimal compactifications along the `d·pol`-weighted boundary ideal
(ShimuraCompactifications §§7.20, 7.31; for (a) also the ample power of the Hodge line on the minimal
compactification, ShimuraCompactifications §7.17), and from the Stacks project, Lemma 29.38.8, the ampleness relative
to the base of a relatively ample line bundle twisted by a large power of the pull-back of a line bundle ample
relative to the base, and Lemma 29.38.9, its passage to the generic fibre: (a) and (b) compose them, for every
sufficiently divisible `d` and all `a ≥ a₀(d)`.

*Method of the formal proof:* in the Siegel case, at odd level `n ≥ 3` over `ℤ[ζ_n, 1/n]` and for one `d`: the
toroidal model is the normalised blow-up of the minimal compactification along an ideal of order `d·pol` along every
degeneration; sections of a line bundle generating the ideal embed the blow-up in the product with a projective space,
where the exterior product of a large power of the ample sheaf with `O(1)` is ample, and its pull-back is the twist by
minus the exceptional divisor; a power of the Hodge line is a power of the pull-back of the ample sheaf of the minimal
compactification. The forms stated here are not proved in [FormalProof]: the route written here takes the same two
steps for the PEL models, through ShimuraCompactifications §§7.17, 7.20 and 7.31 and the Stacks project's Lemmas
29.38.8 and 29.38.9.

Prove the following. Let `Σ` be a complete projective compatible cone system with
polarisation function `pol`.

(a) On the model of ShimuraCompactifications §7.31 in the good-prime fixed singleton setting `J = J₀` of ShimuraCompactifications §7.19 (its minimal input the finite
normalisation of ShimuraCompactifications §7.16 in the higher-level function field, ShimuraCompactifications §7.20 (c)), in particular on the smooth integral toroidal model of
ShimuraCompactifications §7.3 for a smooth projective `Σ` at a good prime, and on their generic fibres: for every sufficiently divisible `d` there is
`a₀(d)` such that `ω^{⊗a} ⊗ O(−Σ_ρ d·pol(ρ)D_ρ)` is ample relative to the base for all `a ≥ a₀(d)`, `ω` the Hodge line.
Over `ℂ` the toroidal compactification for a projective `Σ` is projective by ShimuraCompactifications §2.7; on the generic
fibre (a) names an ample line bundle on it.

(b) On the model of ShimuraCompactifications §7.31 for an arbitrary collection `J`: if `𝓜` is an invertible sheaf on the minimal input `M̃^min_{H,J}`,
ample relative to the base, and `𝓜^tor` its pull-back to `M̃^tor_{H,Σ,J}`, then for every sufficiently divisible `d` there is
`a₀(d)` such that `(𝓜^tor)^{⊗a} ⊗ O(−Σ_ρ d·pol(ρ)D_ρ)` is ample relative to the base for all `a ≥ a₀(d)`. A power of the Hodge
line of one of the `J`-indexed families need not be such a pull-back: when the projection of the `J`-model to the
corresponding singleton model is not finite on the interior (ShimuraCompactifications §§7.20, 7.31), the Hodge line of that family, pulled back from
the singleton model, has degree zero on a proper curve of the interior contracted by the projection, and so does the
boundary twist, which is trivial on the interior; no power of their product is ample (second Check).

[FormalProof] has a statement of the shape of (b) in the Siegel case: for the moduli scheme of principally polarised
abelian schemes of dimension `g ≥ 1` with a structure of odd level `n ≥ 3` over `ℤ[ζ_n, 1/n]`, a normal projective
compactification of it, an ample invertible sheaf `𝓜` on the compactification and the polarisation function `pol` of a
fan, there are `d ≥ 1` and a normalised blow-up of the compactification along an ideal supported in the boundary, with
exceptional divisor `Σ_ρ d·pol(ρ)D_ρ`, on which `𝓜^{⊗a} ⊗ O(−Σ_ρ d·pol(ρ)D_ρ)` is ample for all large `a`; there `d` is
asserted to exist, not to be every sufficiently divisible integer, and the compactification is subject to a condition on
theta functions that is not restated here (`GlobalTheory.Poinc.PoinSt`, in
`Development/AbelianVarietyTheory/Definitions/Divisors/IsThetaCompact.lean`, proved as
`GlobalTheory.T.normalisedBlowup_ampleDivisor_compactification`). [FormalProof] has (a) in the same Siegel case, for one
`d`: a smooth projective toroidal compactification over `ℤ[ζ_n, 1/n]`, with a semi-abelian extension of the universal
abelian scheme and the boundary divisor `Σ_ρ d·pol(ρ)D_ρ` in its charts, and `N ≥ 1` with `ω^{⊗N}` generated by its
global sections, such that `ω^{⊗Nk} ⊗ O(−Σ_ρ d·pol(ρ)D_ρ)` is ample: for one `k`, for the polarisation function of every
fan without self-intersections (`GlobalTheory.Published.SiegelToroidalPolCharts`, in
`Development/AbelianVarietyTheory/PublishedTheorems/Divisors₂/SiegelToroidalPolCharts.lean`, proved as
`GlobalTheory.SiegJoin.siegelToroidalPolCharts`, in
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/SiegelToroidalCompactificationPolarisedCharts.lean`, from
`GlobalTheory.T.normalisedBlowup_ampleDivisor_compactification`), and for all large `k`, for the polarisation function
of one fan (`GlobalTheory.Published.SiegelToroidalIntegral`, in
`Development/AbelianVarietyTheory/PublishedTheorems/AutomorphicForms₂/SiegelToroidalIntegral.lean`, proved as
`GlobalTheory.siegelToroidalIntegral_holds`, in
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/SiegelToroidalIntegralHolds.lean`). The forms of (a) and (b)
stated here, for PEL data, for every sufficiently divisible `d` and all `a ≥ a₀(d)`, are not in [FormalProof].

*Route.* The twist `O(−Σ_ρ d·pol(ρ)D_ρ)` is the inverse image of the normalised blow-up ideal of ShimuraCompactifications §7.31 (ShimuraCompactifications §7.20 on the smooth
good-level model), hence ample relative to the minimal model (the inverse image of a blown-up ideal is relatively ample
for the blow-up, and its pull-back along the finite normalisation stays relatively ample). (a) By ShimuraCompactifications §7.17 a power of `ω` is
the pull-back of an ample invertible sheaf on the neat integral minimal compactification of ShimuraCompactifications §7.16; on the singleton model
of ShimuraCompactifications §§7.19–7.20 (c) the minimal input is finite over it, and the pull-back of an ample sheaf along a finite morphism is ample.
(b) is the same argument with `𝓜` in place of the descended power of `ω`. In both, a step of this route: over a
quasi-compact base, a line bundle that is relatively ample for a morphism to a scheme over the base, twisted by a large
power of the pull-back of a line bundle on that scheme ample relative to the base, is ample relative to the base (Stacks,
Lemma 29.38.8, Tag 0C4K; no roadmap states it, and its proof is not given here); ampleness relative to the base passes
to the generic fibre (Stacks, Lemma 29.38.9, Tag 0893).

*Needs:* ShimuraCompactifications §§7.3, 7.16, 7.17, 7.19, 7.20, 7.31; StableReduction Layer 2 (relative ampleness).

**Checks.**

- For the fine modular curve the boundary twist is `O(−d·cusps)` and `ω^{a}(−d·cusps)` has degree `a·deg ω − d·#cusps`:
  ample exactly when `a > d·#cusps/deg ω`, so the threshold `a₀` grows with `d` and cannot be chosen independently of
  it; for `a = 0` it is never ample.
- The lattice-chain models of the Checks of ShimuraCompactifications §§7.20 and 7.31 project projectively and non-finitely, already on the interior, to a
  singleton model: on a proper curve `Γ` of the interior in a positive-dimensional fibre of that projection, the Hodge line
  of the singleton family pulled back to the lattice-chain model has degree `0`, and `O(−Σ_ρ d·pol(ρ)D_ρ)|_Γ` is trivial, so
  `ω^{⊗a} ⊗ O(−Σ_ρ d·pol(ρ)D_ρ)` has degree `0` on `Γ` for every `a`. A statement of (a) for arbitrary collections would be
  false; (b) needs an ample sheaf on the collection-dependent minimal model.

### 7.31a Global normal projective models with semi-abelian extension

*Origin:* (a): published: Lan (2016), Propositions 6.1 and 6.4, the normal projective minimal input at every prime.
(b): adapted from Lan (2016) and Lan (2017), Theorem 6.1, the normal projective toroidal models at each prime, from
Gabber's lemma (Deligne (1985), *Le lemme de Gabber*), a normal projective model with a semi-abelian extension after a
proper surjective cover, and from Madapusi Pera (2019), toroidal compactifications of integral models of Shimura
varieties of Hodge type: here one normal projective model over all of `O_F`, glued from the models at each prime, with
its normalisations in finite extensions. (b′): particular to this proof: the moduli problem of marked objects
(an action of `𝒪_E` with a signature condition, a cubical line bundle with its isomorphisms, a marking at similitude
level one), with one normal projective model over the whole ring of integers carrying a semi-abelian extension and the
extended cubical line bundle, and local models with invertible direct image; nearest published results: Lan (2016),
integral models of PEL-type moduli problems and their compactifications at every prime; Moret-Bailly (1985), the
unique extension of a cubical structure; Chai (1985), projectivity through theta functions.

*Method of the formal proof:* (b′): at an auxiliary full level the moduli scheme carries a universal family with a theta
structure; semistable reduction over `p`-adic fields, a uniformisation of semi-abelian schemes over complete discrete
valuation rings and a geometric form of Zarhin's trick give a normal projective flat scheme with a semi-abelian scheme
and an ample frame of theta sections, and the other levels are reached through the level maps. (a) and (b) are not
statements of [FormalProof]; the route written here for them goes through the toroidal models of
ShimuraCompactifications §§7.3 and 7.31.

Prove the following. Let `(O, ⋆, L, ⟨·,·⟩, h)` be an integral PEL datum of type A or C (PELModuli M0.5)
satisfying Lan's condition 1.4.3.10 (the hypothesis of ShimuraCompactifications §§7.3 and 7.31), `G` its similitude group scheme over `ℤ` (PELModuli
M0.7), and `K ⊆ G(Ẑ)` an open compact subgroup whose image in `G(Ẑ^p)` is neat for every prime `p`. That `K` lies in `G(Ẑ)`,
i.e. preserves `L ⊗ Ẑ`, is the level hypothesis of ShimuraCompactifications §7.31 (`H ⊆ G(Ẑ)`); it does not follow from neatness away from each prime
(third Check). Let `F` be a number field containing the reflex field `F₀` and the values needed for the level; `Sh_F` is the
generic fibre over `F` of the PEL moduli space of the datum at level `K` (ShimuraCompactifications §7.3, its generic comparison) and `A → Sh_F` its
universal abelian scheme, the one defined by the lattice `L`. A prime is *good* when it lies in the set `□` of the base of ShimuraCompactifications §7.3 for
this datum and level (Lan's good primes of (6-b), the level prime to them); all but finitely many primes are good, and the
others are *bad*.

(a) (*minimal input at every prime*) For every prime `p` and every lattice collection `J` at `p` that satisfies, together
with the datum and the level `H = K`, the hypotheses of ShimuraCompactifications §7.31 (Lan's 2017 setting as ShimuraCompactifications §7.31 states it, the conditions on the
collection being those of the paper of Lan that ShimuraCompactifications §7.31 cites), the minimal input of ShimuraCompactifications §7.31 exists: a normal projective flat
model `M̃^min_{K,J}` over `O_{F_0,(p)}` of the minimal compactification of the generic fibre, whose normalised interior
carries the `J`-indexed tautological semi-abelian families, with the properties that ShimuraCompactifications §7.31 lists. For `J = J₀` at a good
prime it is the finite normalisation of ShimuraCompactifications §7.16 that ShimuraCompactifications §7.31 names. For other collections its projection to a singleton model
need not be finite (ShimuraCompactifications §7.20), and an ample power of the Hodge line of a single family is not asserted on it (7.17a (b)).

(b) (*global model*) For the datum and the level `K ⊆ G(Ẑ)` of the setting, there are a smooth projective toroidal
compactification `Sh^tor_F` of `Sh_F` and a normal scheme `Y`, projective and flat over `O_F`, with generic fibre `Sh^tor_F`
(so that `Sh_F` is a dense open subscheme of it), and a semi-abelian scheme `G → Y` extending `A`, abelian exactly over
`Sh_F` in the generic fibre; the endomorphisms of `A` extend to `G` (ShimuraCompactifications §§6.8, 6.9). If moreover the lattice `L` of the datum is self-dual, so that the polarisation `λ` of `A` is principal, and `w_0 ∈ O` is an element with `w_0 + w̄_0 = 1`, let `ℒ_A := (1, λ∘w_0)^*𝒫` be the pull-back of the Poincaré bundle, a rigidified symmetric line bundle on `A` with `φ_{ℒ_A} = λ`, relatively ample, with `K(ℒ_A)` trivial, and with isomorphisms `(a × 1)^*Λ(ℒ_A) ≅ (1 × ā)^*Λ(ℒ_A)` for `a ∈ O` and `ℒ_A ≅ (1, w_0)^*Λ(ℒ_A)`, where `(1, w_0) : A → A ×_{Sh} A`. (b) does not assert that `ℒ_A` extends to `G`; in the marked form (b′), (ii) extends the line bundle of the marked object, with these isomorphisms, over its global model. This construction of `ℒ_A` is the roadmap's own; in (b′), the form of [FormalProof], the line bundle is part of the marked object. `ℒ_A` is the analogue, with `w_0` in place of `1`, of the graph bundle `(1, λ)^*𝒫` of AbelianSchemesAndArithmeticModuli A2.6, which has `φ = 2λ`; here `φ_{ℒ_A} = λ∘w_0 + (λ∘w_0)^∨ = λ∘(w_0 + w̄_0) = λ` (AbelianSchemesAndArithmeticModuli A2.3, the Rosati involution of `λ` being `a ↦ ā` on `O`). Over a dense open subset of `Spec O_F`, `Y` is
the integral toroidal model of ShimuraCompactifications §7.3. At the bad primes `Y` is built from the models of ShimuraCompactifications §7.31 for the singleton collection
`J₀ = {(1, L, ⟨·,·⟩)}` of the datum's own lattice at level `K`, with the minimal input of (a) (Lan's theorem, proof not given
here); no other level and no other collection is used. Moreover, for an
irreducible component `Y_c` of `Y` (open and closed, `Y` being normal), with function field `K_c`, and a finite extension `L`
of `K_c`, the normalisation `Y_L` of `Y_c` in `L` is a normal scheme, finite over `Y_c`, projective and flat over `O_F`, whose
generic fibre is the normalisation of that of `Y_c` in `L` and contains as a dense open subscheme the finite cover `Sh_L` of
`Sh_F ∩ Y_c` defined by `L` (the normalisation of `Sh_F ∩ Y_c` in `L`); the pull-back of `G` is a semi-abelian scheme on `Y_L`
extending the pull-back of `A` to `Sh_L`, abelian exactly over `Sh_L` in the generic fibre, with the endomorphisms. `Y_L` is a
model of the cover `Sh_L`, not in general of a component of `Sh_F`: if the algebraic closure `F_L` of `F` in `L` is strictly
larger than the algebraic closure `F_{K_c}` of `F` in `K_c` (a constant field extension; for instance `L = K_c·F′` with `F′`
a finite extension of `F` not contained in `K_c`), then `Y_L` is a scheme over `O_{F_L}` and its generic fibre is not
birational over `F` to that of `Y_c` (`F`-isomorphic function fields have `F`-isomorphic algebraic closures of `F`). A
finite extension `F′ ⊆ L` with `F′ ⊆ K_c` changes nothing: for `L = K_c`, `Y_L = Y_c` (second Check).

The clause on the `Y_L` is this roadmap's own (finite normalisation). Where [FormalProof] passes to a cover of the model
of (b′) it does not normalise: for an irreducible component `Y_c` and a finite set `S` of primes containing those dividing
the discriminant of `E`, it takes an integral normal projective scheme `X` with a morphism `X → Y_c`, dominant and of
finite degree on function fields, the pull-back of `G` with its action, and all `p⁴`-torsion points of the generic fibre
rational for `p ∈ S`, and asks moreover that the boundary of `X` have normal crossings. Such an `X` maps to `Y_L`, `L` its
function field, and need not be finite over `Y_c`.

(b′) (*the marked form at similitude level one*) Let `E` be a CM field with complex conjugation `a ↦ ā`, whose ring of
integers `𝒪_E` is unramified over that of its maximal totally real subfield, and which contains a square root `√−d` of
`−d` for a prime `d ≡ 7 (mod 16)`; put `w_0 := (1 + √−d)/2 ∈ 𝒪_E`, so that `w_0 + w̄_0 = 1`. Fix a square root `ρ` of `−d`
in `ℂ`, and let `Φ` be the set of the embeddings `τ : E → ℂ` with `τ(√−d) = ρ`. Let `L` be a finitely generated projective
`𝒪_E`-module of rank `p + q ≥ 1` with a perfect alternating `ℤ`-bilinear form `⟨·,·⟩` such that `⟨ax, y⟩ = ⟨x, āy⟩` for
`a ∈ 𝒪_E`, of signature `(p, q)` in this sense: `L ⊗ ℝ` has a complex structure `J` commuting with `𝒪_E`, with
`⟨Jx, Jy⟩ = ⟨x, y⟩` and `⟨Jx, x⟩ > 0` for `x ≠ 0`, for which the trace of every `a ∈ 𝒪_E` on the complex vector space
`(L ⊗ ℝ, J)` is `Σ_{τ∈Φ}(p·τ(a) + q·τ̄(a))`. Let `M ≥ 3` be an odd integer and `𝔐` an ideal of `𝒪_E` generated by elements
of `ℤ[w_0]`, with `𝔐·𝔐̄ = (M)` and `𝔐 + 𝔐̄ = (1)`.

A *marked object* over a scheme `S` over `ℚ(ρ)` consists of: an abelian scheme `A → S` with an action of `𝒪_E` satisfying
the determinant condition of signature `(p, q)` (at every geometric point `x̄` of `S`, for every ring homomorphism `τ` from
`𝒪_E` to the residue field of `x̄`, the `τ`-eigenspace of `Lie A_{x̄}` has dimension `p` if `τ(√−d)` is the image of `ρ`,
and `q` otherwise: the signature type `Σ_{τ∈Φ}(p·τ + q·τ̄)` of PELModuli M1.3); a rigidified symmetric line bundle `ℒ_A`
on `A` with a cubical structure, relatively ample and with
`K(ℒ_A)` trivial, for which there are isomorphisms `(a × 1)^*Λ(ℒ_A) ≅ (1 × ā)^*Λ(ℒ_A)` on `A ×_S A` for every `a ∈ 𝒪_E`
and an isomorphism `ℒ_A ≅ (1, w_0)^*Λ(ℒ_A)`; and a homomorphism of groups `η : L/𝔐L → A(S)`, the *marking*, such that at
every geometric point `x̄` of `S` there are primitive `n`-th roots of unity `ζ_n` in the residue field with `ζ_{nm}^m = ζ_n`
and isomorphisms of `𝒪_E`-modules `ι_n : L/nL → A_{x̄}[n]` (`n ≥ 1`) with `m·ι_{nm} = ι_n`, with
`e_n(ι_n(x), ι_n(y)) = ζ_n^{⟨x,y⟩}` for the Weil pairing `e_n` on `A_{x̄}[n]` defined by `ℒ_A`, and with `η(x) = ι_M(x)` at
`x̄` for every `x ∈ 𝔐̄L` (as `L = 𝔐L + 𝔐̄L`, this determines `η` at `x̄`). The roots of unity `ζ_n` are not prescribed: the
similitude level is one. An isomorphism of marked objects is an isomorphism of abelian schemes that commutes with the
actions and the markings and carries the line bundles to one another with their rigidifications and their cubical
structures. On an abelian scheme a rigidified line bundle has exactly one cubical structure
(AbelianSchemesAndArithmeticModuli A1.5: the trivialisation of the cube bundle of a rigidified line bundle is canonical), so the cubical
structure of `ℒ_A` is not an additional datum; it is part of the object because the extension `ℒ_G` below carries one.

Prove the following.

(i) (*the moduli scheme*) There are a scheme `Sh`, quasi-projective and smooth of relative dimension `([E:ℚ]/2)·p·q`
(the dimension `Σ_{τ∈Φ} p_τq_τ` of a unitary datum of PELModuli M2.10, with `p_τ = p`, `q_τ = q`) over `ℚ(ρ)`,
and a marked object `(A, ℒ_A, η)` over `Sh`, such that for every reduced scheme `S` over `ℚ(ρ)` and every
marked object over `S` there is exactly one morphism `f : S → Sh` over `ℚ(ρ)` for which the object is isomorphic to the
pull-back by `f` of `(A, ℒ_A, η)`. Moreover `Sh` is rigid on dual numbers: for a field `k` and a morphism
`x : Spec k[ε]/(ε²) → Sh`, with `x_0` the composite `Spec k[ε]/(ε²) → Spec k → Spec k[ε]/(ε²) →x Sh` (the constant
morphism at the closed point of `x`), if the pull-backs of `(A, ℒ_A, η)` by `x` and by `x_0` are isomorphic marked
objects, then `x = x_0`. (`Sh` is reduced, so the first property determines it up to a unique isomorphism.)

(ii) (*the global model*) Let `F` be a subfield of `ℂ`, finite over `ℚ`, that contains `τ(E)` for every embedding
`τ : E → ℂ` and the `M`-th roots of unity (hence `ρ`), and `Sh_F := Sh ⊗_{ℚ(ρ)} F`. If `M/ℓ^{v_ℓ(M)} ≥ 3` for every
prime `ℓ`, there are a normal scheme `Y`,
projective and flat over `O_F`, an open immersion of `Sh_F` into the generic fibre of `Y` with dense image, a semi-abelian
scheme `G → Y` with an action of `𝒪_E`, and a rigidified symmetric line bundle `ℒ_G` on `G` with a cubical structure,
such that: the restriction of `G` to `Sh_F`, with its action, is `A`, and that of `ℒ_G`, with its rigidification and its
cubical structure, is `ℒ_A`; there are isomorphisms `(a × 1)^*Λ(ℒ_G) ≅ (1 × ā)^*Λ(ℒ_G)` on `G ×_Y G` for every
`a ∈ 𝒪_E` and an isomorphism `ℒ_G ≅ (1, w_0)^*Λ(ℒ_G)`; and a point of the generic fibre of `Y` lies in `Sh_F` if and
only if the fibre of `G` over it is an abelian variety.

(iii) (*local models with invertible direct image*) For every nonzero prime `𝔭` of `O_F` whose residue characteristic `p`
satisfies `M/p^{v_p(M)} ≥ 3` there are `Y_𝔭`, `G`, `ℒ_G` with the properties that (ii) lists for `Y`, `G`, `ℒ_G`, over the
localisation `O_{F,(𝔭)}` in place of `O_F`, such that, `π : G → Y_𝔭` being the
structure morphism, `π_*ℒ_G` is an invertible sheaf on `Y_𝔭`, generated locally on `Y_𝔭` by a section of `ℒ_G` that
vanishes identically on no fibre of `π`. `Y_𝔭` is not asserted to be the localisation of the `Y` of (ii).
ArakelovGeometryAndAbelianHeights §5.8 has a pointwise form of (ii)–(iii) with more structure: for a principally
polarised abelian variety over a number field with a symmetric line bundle, after a finite extension, a Moret–Bailly
model over the ring of integers (a semistable group scheme with a cubist hermitian extension of the line bundle, torsion
sections and locally free direct images); (ii)–(iii) are a version over the moduli scheme, without metrics or torsion data.

*Scope.* The group is the similitude group scheme `G` of the integral PEL datum (PELModuli M0.7; for type A the unitary
similitude group, for type C the symplectic similitude group), with similitude character `ν : G → G_m`, and the levels are
the open compact subgroups `K ⊆ G(Ẑ)` whose image in `G(Ẑ^p)` is neat for every prime `p`. Not covered: levels inside the
kernel `G₁ = ker ν` (the unitary or symplectic group of the datum), for instance an open compact subgroup of `G₁(𝔸_f)`, which is
never open in `G(𝔸_f)`: `ν = 1` on it, while every open subgroup of `G(ℚ_ℓ)` contains the scalars `a ∈ 1 + ℓ^kℤ_ℓ` for large `k`,
and `ν(a) = a² ≠ 1` for `a ≠ 1` (fourth Check); levels not contained in `G(Ẑ)` (third Check); Shimura varieties of `G₁` or of
other groups between `G₁` and `G`. (b) gives models of `Sh_F` for the datum and the level `K`, of its components `Sh_F ∩ Y_c`,
and of finite covers of these, with the semi-abelian scheme extending `A` or its pull-back; it does not identify a component
or a finite cover with a Shimura variety of `G₁` at some level, nor the pulled-back family with a family of that variety. The
primes are all primes of `O_F`, good and bad (at the bad ones through the named input (a)). For a Hilbert datum,
ShimuraCompactifications §§8.23, 8.28 and 8.30 give, at the primes not dividing the tame level, a proper toroidal model with
a semi-abelian extension (projectivity not asserted; the minimal models are normal and projective,
ShimuraCompactifications §8.34), and AutomorphicBundles §7.3 gives, over the ring of integers of a finite extension of
`ℚ_p` at every prime `p`, those ramified in the totally real field included, smooth projective components of a toroidal
splitting model with a semi-abelian extension; (b) gives, for a datum in its setting, a normal projective model over all
of `O_F`. (b′) has no similitude level:
its level is the marking of `L/𝔐L`, with no condition on the multiplier. [FormalProof] uses (b′); (a) and (b) are not
inputs of it.

*Route.* (a) A theorem of Lan: [Lan16], Propositions 6.1 and 6.4, pp. 32–35, the locator under which ShimuraCompactifications
§7.31 states the properties of its minimal input; proof not given here, and its construction is not reproduced here.

(b) *Local models.* Fix one smooth projective complete cone system `Σ` admissible for ShimuraCompactifications §7.3 at the good primes and for ShimuraCompactifications §7.31 at
the others (smooth projective refinements, ShimuraCompactifications §0.15), and let `Sh^tor_F` be the toroidal compactification of `Sh_F` for `Σ`: the
common generic fibre of all the local models below. Over the localisation of `O_F` at the good primes, the integral toroidal
model `Y⁰` of ShimuraCompactifications §7.3 (base changed from `O_{F_0}` to `O_F`; smooth over a regular base, hence normal) carries the semi-abelian
family; at each good prime `𝔮`, `Y⁰ ⊗ O_{F,(𝔮)}` is projective (7.17a (a)). At each of the finitely many other primes `𝔭` of
`O_F`, over `p`, the datum, the level `H = K ⊆ G(Ẑ)` (neat away from `p`) and the collection `J₀ = {(1, L, ⟨·,·⟩)}` are in the
setting of ShimuraCompactifications §7.31, with the minimal input of (a). Let `M_𝔭` be the normalisation of the base change to `O_{F,(𝔭)}` of the model
`M̃^tor_{K,Σ,J₀}` of ShimuraCompactifications §7.31 at `p`, with the pull-back of its family indexed by `(1, L, ⟨·,·⟩)`. By the theorem of Lan that ShimuraCompactifications §7.31
cites (Lan 2017, Theorem 6.1; proof not given here), `M_𝔭` is normal, projective and flat over `O_{F,(𝔭)}`; its generic fibre is the normalised
blow-up of the characteristic-zero minimal compactification along the ideal of `Σ`, which is `Sh^tor_F` (`Σ` smooth, `K`
neat); and the family is a semi-abelian scheme `G_𝔭`, abelian exactly over `Sh_F` in the generic fibre, whose restriction to
`Sh_F` is the tautological family of the moduli problem defined by `L` at level `K`, that is `A`.

*Spreading out.* `Spec O_{F,(𝔭)}` is the limit of the open neighbourhoods of `𝔭` in `Spec O_F`. The closed immersion of `M_𝔭`
into a projective space, the group scheme `G_𝔭` with its group law, and the isomorphism of their generic fibres with
`Sh^tor_F` and its semi-abelian family over the good model (unique by ShimuraCompactifications §6.8 on the normal `Sh^tor_F`) are of finite
presentation, so they descend: there are an open `V ∋ 𝔭`, a projective flat `M′ → V` with `M′ ×_V Spec O_{F,(𝔭)} = M_𝔭`, a smooth
commutative group scheme `G′ → M′` restricting to `G_𝔭`, and a nonempty open `W ⊆ V` of good primes over which `(M′, G′)` is
isomorphic to `(Y⁰, family)` (SchemeAndStackFoundations §0.9: schemes, morphisms and the properties closed immersion, flat,
smooth, isomorphism descend to a finite stage). Put `V_𝔭 = W ∪ {𝔭}`, open since its complement in `Spec O_F` is a finite
set of closed points, and containing no other bad prime. Every point of `M′|_{V_𝔭}` lies over `W`, where `(M′, G′)` is the good
model with its family, or over `𝔭`, where its local rings and the fibres of `G′` are those of `M_𝔭` and `G_𝔭`; so `M′|_{V_𝔭}` is
normal and `G′` is semi-abelian on it.

*Gluing.* Glue `Y⁰` (over the good locus `U₀`) and the `M′|_{V_𝔭}` along the isomorphisms over `W_𝔭 = V_𝔭 ∖ {𝔭} ⊆ U₀`. For two
bad primes, `V_𝔭 ∩ V_𝔭′ ⊆ U₀`, and both identifications go through `Y⁰`, so the cocycle condition holds; the semi-abelian
schemes glue along the unique isomorphisms of ShimuraCompactifications §6.8. The result `Y₁` is normal, flat, separated and proper over `O_F` (these
are local on the base), with generic fibre `Sh^tor_F` and a semi-abelian scheme `G₁` extending `A`; every prime has an open
neighbourhood over which `Y₁` is projective (a closed immersion into a projective space over `O_{F,(𝔮)}` descends to a
neighbourhood, SchemeAndStackFoundations §0.9).

*Projectivity.* Cover `Spec O_F` by finitely many affine opens `V_i` over which `Y₁` is projective; each `Y₁|_{V_i}` is
quasi-projective over `O_F` (it has an ample line bundle and is of finite type over the affine `Spec O_F`). Chow's lemma
(SchemeAndStackFoundations §4.12), in the form its proof gives for a finite cover by opens that are quasi-projective over
the base, yields `Y₂`, the scheme-theoretic closure (SchemeAndStackFoundations §4.11) of the graph of `U → ∏_iℙ^{N_i}_{O_F}` over `U = ⋂_iY₁|_{V_i}`, with
`Y₂` projective over `O_F` and `π : Y₂ → Y₁` projective and an isomorphism over `U`. Here `U = Y₁|_{⋂_iV_i}` contains the
generic fibre. `Y₂` is reduced and `O_F`-flat (the closure of the reduced flat `U`, SchemeAndStackFoundations §0.8). Let `Y` be its normalisation:
finite over `Y₂` (schemes of finite type over `O_F` are Nagata, SchemeAndStackFoundations §0.20), hence projective over `O_F`; normal; flat, every
irreducible component meeting `U`; and `Y → Y₁` is an isomorphism over the normal `U`, in particular on the generic fibre.
Let `G` be the pull-back of `G₁`: semi-abelian, extending `A`, abelian exactly over `Sh_F` in the generic fibre (as on the
toroidal compactification `Sh^tor_F`, ShimuraCompactifications §7.3). Over the dense open `⋂_iV_i ∩ U₀`, `Y = Y⁰`. The endomorphisms extend by ShimuraCompactifications §§6.8, 6.9
on the normal `Y`.

*Finite covers.* The normal noetherian `Y` is the disjoint union of its irreducible components, so `Y_c` is normal and open
and closed, and flat over `O_F`. The normalisation `Y_L` of the integral `Y_c` in `L` is finite over `Y_c` (SchemeAndStackFoundations §0.20), hence
projective over `O_F`; it is normal by construction and flat (integral and dominating `Spec O_F`). The generic fibre is the
localisation at `O_F ∖ {0}`, not an open subscheme; integral closure commutes with this localisation and with restriction
to the open `Sh_F ∩ Y_c` of the generic fibre, which gives the generic fibre of `Y_L` and its open `Sh_L`. The pull-back of a
semi-abelian scheme is semi-abelian, and it is abelian exactly over the preimage of the abelian locus. The endomorphisms
pull back. Constants: the ring of integers of `F_L` consists of elements of `L` integral over `ℤ`, hence lies in every local
ring of the normal `Y_L`, so `Y_L` maps to `Spec O_{F_L}`.

*Why (b) does not extend `ℒ_A`.* Once `ℒ_A` is extended to a line bundle on `G`, its rigidification, its symmetry and its cubical
structure extend with it over the normal locally noetherian `Y` ([FormalProof] `GlobalTheory.T.exists_cubical_rigidified_extension`,
in `Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/ExistsCubicalRigidifiedExtensionStatement.lean`). The
line bundle itself is the obstacle: over a regular base `G` is regular and the closure of a divisor of `ℒ_A` is Cartier, but
`Y` is only known to be normal, and over a normal base that is not regular a Weil divisor on `G` need not be Cartier.
[FormalProof] constructs the extension, with its isomorphisms, on its model of (b′)
(`GlobalTheory.T.exists_rigidified_symmetric_cubicalBundle_extension`); this is (b′) (ii).

(b′) The statement of [FormalProof] in this form; its proof is not given here. Its proof there uses the semistable reduction
theorem for polarised abelian varieties over the finite extensions of `ℚ_p` (after a finite extension there is a semi-abelian
group scheme over the ring of integers with the given generic fibre: NeronModelsAndSemistableAbelianVarieties §3.10, with
§§3.1 and 3.3), which [FormalProof] states as
`Development/AbelianVarietyTheory/PublishedTheorems/SemistableReduction₂/SemistableReductionSt.lean`
(`GlobalTheory.Published.SemistableReductionSt`), proves as
`Development/AbelianVarietyTheory/Proofs/DegenerationProofs/SemistableReductionPpavPadicFieldStatement.lean`
(`GlobalTheory.T.semistableReduction_ppav_padicField`) and applies in
`Development/AbelianVarietyTheory/Proofs/ModuliProofs/PartOneOfSemistableReductionPadicPolarized.lean`
(`GlobalTheory.partI_of_semistableReduction`). There it is the proposition
`ReciprocityTheory.ChartRestriction.G.Geo.Tor.PartI` (in `ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/BirationalGeometry/ToroidalCompactification/UniformisationConclusion.lean`,
proved as `GlobalTheory.CompanionTheory.Ar.Top.partI_holds`), at similitude level `A = 1` of its structure `Level`: the
moduli scheme of (i) is the structure `Moduli` and the model of (ii) the structure `Model` (in `PushInvertible.lean` of the
same folder), and their existence is stated by the clauses `N1ab` (in `HeckeKer.lean`, at every level) and `N6` (in `Clauses.lean`, at the
levels good at every prime); (iii) is the condition `PushInvertible` of the local models in the clause `N2` (in
`Clauses.lean`), which are indexed by the levels good at the prime `p` (`Idx`). A level is good at `p` when
`M/p^{v_p(M)} ≥ 3` (`Level.GoodAt`, in `TwoWeightEqOneAddRoot.lean` of the same folder). (i) follows from [FormalProof],
`Development/AbelianVarietyTheory/Proofs/ModuliProofs/ExistsModuliSchemePolarizedAbelianLevel.lean`
(`GlobalTheory.Moduli.moduli_scheme_exists`), of the statement
`ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/BirationalGeometry/ToroidalCompactification/HeckeKer.lean`
(`ReciprocityTheory.ChartRestriction.G.Geo.Tor.N1ab`). If the marked problem is identified with
the PEL moduli problem of (b) for the datum `(𝒪_E, ¯, L, ⟨·,·⟩, h)` at the level `K ⊆ G(Ẑ)` of the elements that act
trivially on `L/𝔐L` and with multiplier in `Ẑ^×`, then (b) for that level gives the model, the semi-abelian scheme
and the action of (b′) (ii), with the line bundle `ℒ_A` of (b) in place of the datum `ℒ_A`, and not the extension of `ℒ_A`
to `G`, which (b′) (ii) adds; this identification (Lan's condition for the datum, the neatness of `K` away from each prime,
which uses the hypothesis `M/ℓ^{v_ℓ(M)} ≥ 3` of (ii), and the passage from polarisations up to similitude to a polarising line bundle) is not given
here. Through this identification, and under that hypothesis, (i) follows on the generic fibre from PELModuli M2.8 and M2.9 (at neat level a smooth
separated algebraic space with a unique classifying map for every scheme, reduced or not, which gives the rigidity on dual
numbers) and ShimuraCompactifications §7.18 (quasi-projectivity).

*Needs:* 7.17a; ShimuraCompactifications §§0.15, 6.1, 6.8, 6.9, 7.3, 7.16, 7.19, 7.20, 7.31; PELModuli M0.5, M0.7, M1.3, M2.10, M4.5, M4.6;
AbelianSchemesAndArithmeticModuli A1.5, A2.2, A2.3 (the cube theorem, the Poincaré bundle, the Mumford map); SchemeAndStackFoundations
§§0.8, 0.9, 0.20, 4.11, 4.12 (flatness over Dedekind bases, limits and spreading out, finiteness of normalisation,
scheme-theoretic closure, Chow's lemma).

**Checks.**

- Good primes only. For the modular curve `X(N)`, `N ≥ 3`, over `ℤ[ζ_N, 1/N]` (the primes not dividing `N`), the model of ShimuraCompactifications §7.3 is
  the compactified Deligne–Rapoport model, and `G` is the identity component of the smooth locus of its universal generalised
  elliptic curve (the Tate curve at the cusps), abelian exactly off the cusps in the generic fibre. `N ≥ 3` does not put the
  principal congruence subgroup `K(N)` in the setting of (b), which asks neatness away from EVERY prime, the primes dividing `N`
  included: away from `p` the image of `K(N)` is the principal congruence subgroup of the prime-to-`p` part of `N`, so (b)
  applies when that part is `≥ 3` for every `p` (`N = 12, 15, 20, 21, …`), and not when `N` is a prime power or twice an odd
  prime power: for `N = 3` the image away from `3` is all of `GL₂(Ẑ^3)`, which contains `−I`, and for `N = 6` the image away
  from `3` is the principal congruence subgroup of level `2`, which contains `−I` as well.
- The finite-cover clause produces models of covers. Let `Y_c` be a component whose generic fibre is geometrically integral
  over `F` with function field `K_c` (for instance `X(15)`, at the level `K(15)`, which is in the setting of (b) by the previous
  Check, over `F = ℚ(ζ_15)`; then `F` is algebraically closed in `K_c`), and `L = K_c·F′` for a finite extension `F′ ≠ F` of `F`
  (for `X(15)`, `F′ = F(i)`, as `i ∉ ℚ(ζ_15)`). The generic fibre of `Y_L` is `Y_{c,F} ⊗_F F′`,
  whose function field `L` has degree `[F′:F]` over `K_c`; it cannot contain the component of `Sh_F` in `Y_c` as a dense open
  subscheme over `F`, which would make its function field `K_c`. It is a model of the cover, with the pulled-back
  semi-abelian scheme. If instead the generic fibre of `Y_c` is not geometrically connected and `F′ ⊆ K_c` (a component of
  `Sh_F` defined over a larger field of constants), then `L = K_c·F′ = K_c` and `Y_L = Y_c`: the condition of (b) is on the
  algebraic closure of `F` in `L` compared with that in `K_c`, not on `F′ ⊆ L`.
- The level hypothesis `K ⊆ G(Ẑ)` is not implied by neatness. For the genus-one Siegel datum (`G = GL₂`, `L = ℤ²`), let `K` be
  the conjugate of `GL₂(ℤ_p)` by `diag(p^{−1}, 1)` at `p`, the principal congruence subgroups of levels `ℓ₁` and `ℓ₂` at two
  odd primes `ℓ₁ ≠ ℓ₂` different from `p`, and `GL₂(ℤ_ℓ)` elsewhere. Its image away from every prime contains a principal
  congruence factor of odd prime level, hence is neat; but it contains `[[1, p^{−1}], [0, 1]]` at `p`, which does not preserve
  `ℤ_p²`, so there is no moduli problem of the datum `ℤ²` at level `K` and ShimuraCompactifications §7.31 does not apply to it. `K` preserves the lattice
  `p^{−1}ℤ_pe₁ ⊕ ℤ_pe₂` at `p` (every compact open subgroup preserves some lattice); (b) concerns the integral datum built on a
  `K`-stable lattice, when that datum satisfies the hypotheses of the setting, and its `A` is the family of that lattice.
- Levels of the kernel of `ν` are not open. For the genus-one Siegel datum (`G = GL₂`, `ν = det`, `G₁ = SL₂`), let `K₁ ⊆ SL₂(Ẑ)`
  be any open compact subgroup of `SL₂(𝔸_f)`. Every open subgroup of `GL₂(ℚ_ℓ)` contains `diag(a, a)` for all `a ∈ 1 + ℓ^kℤ_ℓ`
  and some `k`, of determinant `a² ≠ 1` when `a ≠ 1` (for odd `ℓ`, `v_ℓ((1 + ℓ^k)² − 1) = k`), so `K₁`, on which `det = 1`, contains
  no open subgroup of `GL₂(𝔸_f)`: it is not a level of the setting, whatever lattice is chosen. (b) applies to open compact
  `K ⊆ GL₂(Ẑ)` neat away from every prime, such as the principal congruence subgroup of level `ℓ₁ℓ₂` for two distinct odd primes
  (away from each prime it keeps a principal congruence factor of odd prime level).
- The model is not a normalisation of a Siegel model "in the function field of `Sh_F`": for a modular curve, Zarhin's trick
  (`E ↦ (E × E^∨)^4`, which makes the polarisation principal) maps the curve to the moduli space of principally polarised
  abelian `8`-folds, of dimension `36`, so the map is not dominant and a normalisation only makes sense relative to its
  schematic image; and the pulled-back family is `(E × E^∨)^4`, of dimension `8` and of toric rank `8` at a cusp, not `E`.

### Examples

From the Check of 7.17a: on the fine modular curve the boundary twist is `O(−d·cusps)`, and `ω^{a}(−d·cusps)`, of degree `a·deg ω − d·#cusps`, is ample exactly when `a > d·#cusps/deg ω`, so the threshold `a₀` of 7.17a grows with `d`. From the Checks of 7.31a: the principal congruence subgroup `K(N)` of `GL₂(Ẑ)` is in the setting of 7.31a (b) when the prime-to-`p` part of `N` is `≥ 3` for every prime `p` (`N = 12, 15, 20, 21, …`), and not for `N = 3` or `N = 6`, whose images away from `3` contain `−I`; for `X(15)` over `F = ℚ(ζ_15)` and `F′ = F(i)`, the normalisation in `L = K_c·F′` is a model of a cover with function field of degree `[F′:F]` over `K_c`, not of a component of `Sh_F`; for the genus-one Siegel datum, the conjugate of `GL₂(ℤ_p)` by `diag(p^{−1}, 1)` at `p` with principal congruence factors at two odd primes is neat away from every prime but does not preserve `ℤ_p²`, and an open compact subgroup of `SL₂(𝔸_f)` is never open in `GL₂(𝔸_f)`.

### Dependencies

Layer 6 (6.9a, for 7.12a); ShimuraCompactifications §§0.15, 6.1, 6.4–6.6, 6.8, 6.9, 7.3, 7.16, 7.17, 7.19, 7.20, 7.31; PELModuli §§M0.5, M0.7, M1.3, M2.10, M4.5, M4.6; AbelianSchemesAndArithmeticModuli §§A1.5, A2.2, A2.3; SchemeAndStackFoundations §§0.8, 0.9, 0.20, 4.11, 4.12; StableReduction Layer 2; NeronModelsAndSemistableAbelianVarieties §§3.1, 3.3, 3.10.

## Layer 9: Descent of linearised line bundles

This layer states one descent lemma for line bundles along quotients by finite groups.

### 9.1 Descent of a linearised line bundle to a quotient by a finite group

*Origin:* published: Drezet and Narasimhan (1989), Théorème 2.3, Kempf's descent lemma over `ℂ` for a reductive group
with a good quotient and a vector bundle, and Alper (2013), Theorem 10.3, the descent of vector bundles to good moduli
spaces, which covers every field of characteristic zero: here the case of a finite group and a line bundle.

*Method of the formal proof:* over a number field, with `L = O(D)` and the cocycle `c`, Hilbert's Theorem 90 for the
function field (through a Poincaré series and the independence of characters, for an action that need not be
faithful) gives a `Γ`-invariant divisor `D′`; an invariant local equation of `D′` at a point `x` is the inverse of the
trace over `Γ` of the product of a section that generates at `x` and vanishes on the rest of the orbit with a function
chosen, by the independence of the characters induced on the residue field, so that the trace still generates at `x`,
which uses that the order of the inertia group is invertible; the invariant local equations then define a Cartier
divisor on the quotient.

*Corollary of:* EquivariantIntersectionTheory §1.5 (a linearised invertible sheaf on a projective scheme over a field
descends to the quotient by a finite group of invertible order if and only if the inertia groups of the closed points
act trivially on its fibres).

Let `k` be a field of characteristic zero, `X` an integral projective `k`-scheme, `Γ` a finite group acting on `X` by `k`-automorphisms, and `π : X → W` its quotient (SchemeAndStackFoundations §1.17 over `Spec k`): `π` is affine and `Γ`-invariant and `O_W → (π_*O_X)^Γ` is an isomorphism. Let `L` be a line bundle on `X` with a `Γ`-linearisation (EquivariantIntersectionTheory §1.1 for the constant group `Γ`: isomorphisms `φ_γ : γ^*L ≅ L` with `φ_{γδ} = φ_δ∘δ^*φ_γ`) such that for every point `x` of `X` and every `γ` in the inertia group of `x` (`γx = x`, and `γ` acts trivially on the residue field `κ(x)`), `φ_γ` is the identity on the fibre `L ⊗ κ(x)`. Prove that there is a line bundle `N` on `W` with `π^*N ≅ L`.

*Route.* Write `L = O(D)` for a Cartier divisor `D`; the linearisation becomes rational functions `c(γ)` with `γ^*D = D + div c(γ)` and `c(γδ) = δ^*(c(γ))·c(δ)`. By the hypothesis at the generic point `c` is trivial on the elements acting trivially on `k(X)`, so Hilbert's Theorem 90 for `k(X)` over `k(X)^Γ` gives `f` with `c(γ) = γ^*f/f`, and `D′ = D + div f` is `Γ`-invariant. At every point `D′` has a local equation that is a `Γ`-invariant rational function (the inertia condition, and an average over the inertia group, which is where characteristic zero is used). Invariant rational functions are functions on `W`; the invariant local equations define a Cartier divisor `E` on `W` with `π^*E = D′`, and `N = O(E)`. This is Kempf's descent lemma ([DN], Théorème 2.3) for a finite group and a line bundle. The proof that `D′` has a `Γ`-invariant local equation at every point is not given here beyond this indication. SchemeAndStackFoundations §1.17 descends, for an ample `L`, a power of the norm `⊗_γγ^*L` over any noetherian base; 9.1 descends `L` itself when the inertia groups act trivially on its fibres. For a free action `π` is a `Γ`-torsor, the inertia groups are trivial, and 9.1 is the descent along it of EquivariantIntersectionTheory §1.4 (`Pic [X/Γ] ≅ Pic^Γ(X)`); 9.1 extends it to actions whose inertia groups act trivially on the fibres of `L`.

*The form of the formal proof.* [FormalProof] has the statement over number fields, with the linearisation written as the cocycle `c` and the local equations of the Route (`GlobalTheory.T.exists_descent_linearised_lineBundle_finiteGroup_quotient`, in `Development/AbelianVarietyTheory/Proofs/DivisorProofs/ExistsDescentLinearisedLineBundleFiniteGroupQuotStatement.lean`). [DN] Théorème 2.3 is the case `k = ℂ`: it is stated there for a reductive group acting on an integral complex variety with a good quotient and a vector bundle, with the condition at the closed points whose orbit is closed; the orbits of a finite group are closed, and at a closed point of a complex variety the stabiliser is the inertia group. Over every field of characteristic zero the statement is a case of Alper (2013), Theorem 10.3, for the good moduli space `[X/Γ] → W` (EquivariantIntersectionTheory §1.5).

**Checks.**

- `X = ℙ¹` with `Γ = {±1}` acting by `t ↦ −t`, `W = ℙ¹` with coordinate `t²`. For `L = O([0])` with its natural linearisation, `−1` acts by `−1` on the fibre at the fixed point `0` (the fibre is the tangent line), and `L` does not descend (pull-backs from `W` have even degree).
- For `L = O(2[0])` the action on the fibres at `0` and `∞` is trivial and `L` is the pull-back of `O(1)`.

### Examples

From the Checks of 9.1: for `X = ℙ¹` with `Γ = {±1}` acting by `t ↦ −t` and `W = ℙ¹` with coordinate `t²`, the line bundle `O([0])` with its natural linearisation does not descend (`−1` acts by `−1` on the fibre at `0`, and pull-backs from `W` have even degree), while `O(2[0])` satisfies the hypothesis of 9.1 and is the pull-back of `O(1)`.

### Dependencies

No earlier layer. SchemeAndStackFoundations §1.17 (quotients of projective schemes by finite groups); EquivariantIntersectionTheory §1.1 (linearisations) and §1.5 (descent to the quotient by a finite group, of which 9.1 is a corollary). Schemes, line bundles and their pull-backs are those of SchemeAndStackFoundations.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns: the growth bounds for the Hodge metric of a semi-abelian degeneration over a smooth complex variety with a normal crossings divisor and the seminegativity of the Lie algebra of a semi-abelian scheme over a curve in characteristic zero (6.2a); the logarithmic periods of a semi-abelian scheme over a polydisc (6.7a); conjugate data on curves in characteristic `p` (6.9a) and their hypotheses on the global model and on the reduced schemes over it (7.12a); the ampleness of twisted Hodge lines on projective toroidal models (7.17a); the minimal input at every prime, the global normal projective models with semi-abelian extension and their normalisations in finite extensions (7.31a (a), (b)), and the marked form, whose global model carries the cubical line bundle of a principal polarisation (7.31a (b′)); and the descent of a linearised line bundle on an integral projective scheme in characteristic zero to a quotient by a finite group (9.1), a case of EquivariantIntersectionTheory §1.5, which [FormalProof] proves over number fields. The statements of Layers 6 and 7 extend [ShimuraCompactifications](../../ShimuraCompactifications/README.md) and carry the numbers of its layers, and 9.1 extends [SchemeAndStackFoundations](../../SchemeAndStackFoundations/README.md).

Not owned here. Semi-abelian schemes, degeneration data, Mumford's construction, the extension of homomorphisms and of PEL endomorphisms across the boundary, Frobenius and Verschiebung, the integral toroidal compactifications at good primes, the integral minimal compactification and the power of the Hodge line pulled back from it, finite normalisations at higher level, and normalised blow-ups of minimal compactifications are ShimuraCompactifications Layers 0, 6 and 7. Integral PEL data, similitude groups, signature types, the PEL moduli problem, the Kodaira–Spencer map and normal integral models at higher level are [PELModuli](../../PELModuli/README.md) Layers M0–M4. Flatness over Dedekind bases, limits and spreading out, Nagata rings, quotients of projective schemes by finite groups, scheme-theoretic closures and Chow's lemma are SchemeAndStackFoundations Layers 0, 1 and 4, and relative ampleness is [StableReduction](../../StableReduction/README.md) Layer 2; the relative ampleness of a twisted relatively ample line bundle used in 7.17a is classical, and no roadmap states it. Linearised invertible sheaves and their descent to the quotient by a finite group (§1.5, the general theorem of which 9.1 is a corollary) are [EquivariantIntersectionTheory](../../EquivariantIntersectionTheory/README.md) Layer 1. The Faltings and Deligne normalisations of the metric on the Hodge bundle and the extension of homomorphisms of abelian schemes over a normal base are [ArakelovGeometryAndAbelianHeights](../../ArakelovGeometryAndAbelianHeights/README.md) Layer 2, and the computation behind the logarithmic growth of the Faltings metric is ArakelovGeometryAndAbelianHeights §5.3. The theorem of the cube, the Poincaré bundle and the Mumford map, de Rham cohomology with its Hodge filtration and Gauss–Manin connection, Riemann forms and the comparison with the Betti local system are [AbelianSchemesAndArithmeticModuli](../../AbelianSchemesAndArithmeticModuli/README.md) Layers A1, A2, A4 and A5. Degrees on curves for metrics of logarithmic growth, curvature of sub-bundles and quotient bundles, and good metrics along a boundary are [SingularHermitianMetricsAndL2Methods](../SingularHermitianMetricsAndL2Methods/README.md).

In this family, [ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties](../ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties/README.md) uses 6.2a, 6.7a, 6.9a, 7.12a, 7.17a (a), 7.31a (b) and (b′), and 9.1. The global model and its finite covers are those of 7.31a (b); a cubical line bundle extending that of the principal polarisation over a global model is given by 7.31a (b′) (ii), not by (b). 7.31a (b) is stated for the similitude group `G` of the datum and levels `K ⊆ G(Ẑ)` neat away from every prime (its Scope). 7.31a (b′) has a marking and no similitude level; it is the form that 6.9a and 7.12a use for the cubical line bundle. This roadmap does not compare the two.

## Exact supplier contracts

### From TauCetiRoadmap.ShimuraCompactifications

§0.15: smooth projective refinements of cone systems. §6.1: semi-abelian schemes. §6.2: character sheaves and homomorphisms from tori. §§6.4–6.7: polarised degeneration data, Mumford's construction, the degeneration equivalence and the universal degeneration on a cusp chart; the periods live on the complement of the boundary (§6.4), and the invariant differential `du/u` at a modular cusp (the Check of §6.7). §§6.8, 6.9: extension of homomorphisms and of PEL endomorphisms across the boundary over a normal base, unique. §6.15: the pull-back `V^* : E → Frob^*E` of invariant differentials by the Verschiebung of a semi-abelian scheme. §6.18: Frobenius and Verschiebung of commutative group schemes. §7.3: the integral toroidal compactification over the good primes, smooth over the base for a smooth cone system, with its semi-abelian family, its generic comparison and the set `□` of good primes. §7.16: the integral minimal compactification. §7.17: a power of the Hodge line is the pull-back of an ample invertible sheaf on the neat integral minimal compactification. §§7.19, 7.20: finite normalisations at higher `p`-level and the charts of normalised models, with the projections of collection models to singleton models, finite on the singleton setting and not finite in general. §7.31: normalised blow-ups of minimal compactifications in Lan's setting, with the minimal input, the models `M̃^tor_{H,Σ,J}`, their normalised blow-up ideals and their properties; with §§7.17 and 7.20, what the route of 7.17a takes from this roadmap; the ampleness of the twisted line also needs the Stacks project's Lemma 29.38.8, which no roadmap states.

### From TauCetiRoadmap.PELModuli

§M0.5: integral PEL data. §M0.7: the similitude group scheme over `ℤ` and its similitude character. §M1.3: the signature type of an `O_F`-abelian scheme for a CM field `F`. §M2.10: the Kodaira–Spencer map of an abelian scheme, which agrees with the Gauss–Manin description on `H¹_dR`, and the relative dimension `Σ_{τ∈Φ} p_τq_τ` of a unitary datum. §§M4.5, M4.6: normal integral models at higher `p`-level, their finiteness, normality and flatness.

### From TauCetiRoadmap.SchemeAndStackFoundations

§0.8: flatness over Dedekind bases (the scheme-theoretic closure of a reduced flat open subscheme is reduced and flat). §0.9: limits of schemes and spreading out: schemes, morphisms and the properties closed immersion, flat, smooth and isomorphism descend to a finite stage. §0.20: schemes of finite type over a ring of integers are Nagata, so normalisations are finite. §1.17: the quotient of a projective scheme by a finite group (`finiteGroupQuotient_projective`): finite, surjective and invariant, with `O = (q_*O)^Γ`. §4.11: scheme-theoretic closures. §4.12: Chow's lemma.

### From TauCetiRoadmap.StableReduction

Layer 2: projective morphisms and relative ampleness of an invertible sheaf, the notion of 7.17a and 7.31a (b′).

### From TauCetiRoadmap.ArakelovGeometryAndAbelianHeights

§2.0: extension of homomorphisms of abelian schemes over a normal base. §§2.1, 2.2: Deligne's normalisation `‖α‖²_Del = (2π)^{−g}|∫α ∧ ᾱ|` and the Faltings norm `‖ω‖²_Fal = 2^{−g}·i^{g²}∫ ω ∧ ω̄` of a top form, which is a covolume. §2.7: `‖α‖²_Del = π^{−g}‖α‖²_Fal`. §2.8: the Faltings metric on families and on the Siegel space, `‖dz₁ ∧ ⋯ ∧ dz_g‖²_Fal = det Im τ`. §5.0a: the degeneration charts of the principal Siegel toroidal compactifications, with the period pairing `u·∏_j x_j^{s_j}` on a polydisc (compared at 6.7a). §5.3: the computation of the Hodge metric near the boundary behind the logarithmic growth of the Faltings metric.

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

§A1.5: the theorem of the cube: the trivialisation of the cube bundle of a rigidified line bundle is canonical. §A2.2: the dual abelian scheme and the Poincaré bundle. §A2.3: the Mumford map `φ_L`, with `m^*L ⊗ p₁^*L^{−1} ⊗ p₂^*L^{−1} ⊗ π²^*e^*L ≅ (1 × φ_L)^*𝒫` and `φ_{f^*L} = f^∨∘φ_L∘f`. §A4.3: first de Rham cohomology with its Hodge filtration and Gauss–Manin connection. §A5.2: Riemann forms and their positivity. §A5.6: analytic families (the quotient of the Lie bundle by a local system of lattices) and the comparison of de Rham cohomology with the Betti local system.

### From TauCetiRoadmap.EquivariantIntersectionTheory

§1.1: linearisations of invertible sheaves; for a finite constant group `Γ`, isomorphisms `φ_γ : γ^*L ≅ L` with the cocycle condition. §1.5: for a finite constant group of order invertible in the field acting on a projective scheme, a linearised invertible sheaf descends to the quotient of SchemeAndStackFoundations §1.17 if and only if the inertia groups of the closed points act trivially on its fibres; the theorem of which 9.1 is a corollary.

### From TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties

§3.1: the semistable reduction predicate. §3.3: a semi-abelian model is the identity component of the Néron model. §3.10: semistable reduction after a finite separable extension. Used in 7.31a (b′), as an input of the proof of [FormalProof], which is not given here.

### From SingularHermitianMetricsAndL2Methods, a sub-roadmap of this family

2.5: on a compact Riemann surface, the degree of a line bundle with a metric of logarithmic growth at finitely many punctures is the integral of its curvature form, and is `≥ 0` when the curvature is semipositive. 3.2a: (a) Griffiths semipositivity passes to quotient bundles with the quotient metric; (b) the curvature of a sub-bundle in terms of the second fundamental form. 5.3: good metrics along a boundary, with the growth condition (i) and the derivative condition (ii).

## References

- [Lan16] K.-W. Lan, *Compactifications of PEL-type Shimura varieties in ramified characteristics*, Forum Math. Sigma (2016), doi:10.1017/fms.2015.31: Propositions 6.1 and 6.4, pp. 32–35, 7.17a and 7.31a.
- K.-W. Lan, *Integral models of toroidal compactifications with projective cone decompositions*, IMRN (2017), doi:10.1093/imrn/rnw123: Theorem 6.1, 7.17a and 7.31a (b).
- G. Faltings and C.-L. Chai, *Degeneration of abelian varieties* (1990): the computation behind ArakelovGeometryAndAbelianHeights §5.3, 6.2a; chapters II–III and chapter V, proof of Proposition 4.5, 6.7a; the degeneration data, 7.12a.
- The Stacks project, Lemma 29.38.8 (Tag 0C4K) and Lemma 29.38.9 (Tag 0893): 7.17a.
- [FormalProof] Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions announced in [Announcement]; source with a public verification setup: <https://github.com/leanprover-community/riemann-hypothesis>. The forms it establishes are recorded at the targets that name it (6.2a, 6.7a, 6.9a, 7.12a, 7.17a, 7.31a and 9.1), with the declarations and their paths relative to the directory `src/` of the first commit of that repository, the source as published: <https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005/src>.
- [Announcement] Levent Alpöge, the announcement of that proof, 20 November 2026: <https://alpo.ge/remark.pdf>.
- [DN] J.-M. Drezet and M. S. Narasimhan, *Groupe de Picard des variétés de modules de fibrés semi-stables sur les courbes algébriques*, Invent. Math. 97 (1989): Théorème 2.3 (Kempf's descent lemma, over `ℂ`), 9.1.
- J.-B. Bost, *Germs of analytic varieties in algebraic varieties: canonical metrics and arithmetic algebraization theorems*, in *Geometric aspects of Dwork theory*, de Gruyter (2004), pp. 371–418: section 2.4 and Corollary 2.7, 6.2a.
- P. Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, Séminaire Bourbaki 1983/84, exposé 616, Astérisque 121–122 (1985), 25–41: Lemme 1.18, 6.7a.
- W. Goldring and J.-S. Koskivirta, *Strata Hasse invariants, Hecke algebras and Galois representations*, arXiv:1507.05032 (2015): sections 6.1.2–6.1.4 and Theorem 6.2.1, 6.9a.
- T. Ekedahl and G. van der Geer, *Cycle classes of the E-O stratification on the moduli of abelian varieties*, arXiv:math/0412272 (2004): the section on the toroidal compactification, 6.9a.
- V. Cristante, *Theta functions and Barsotti–Tate groups*, Ann. Sc. Norm. Sup. Pisa 7 (1980): 6.9a.
- M. Candilera and V. Cristante, Ann. Sc. Norm. Sup. Pisa 10 (1983): 6.9a.
- P. Deligne, *Le lemme de Gabber*, Astérisque 127 (1985), pp. 131–150: 7.31a (b).
- K. Madapusi Pera, *Toroidal compactifications of integral models of Shimura varieties of Hodge type*, Ann. Sci. Éc. Norm. Sup. (4) 52 (2019), pp. 393–514, doi:10.24033/asens.2391: 7.31a (b).
- L. Moret-Bailly, *Pinceaux de variétés abéliennes*, Astérisque 129 (1985): 7.31a (b′).
- C.-L. Chai, *Compactification of Siegel moduli schemes*, London Math. Soc. Lecture Note Ser. 107 (1985): 7.31a (b′).
- J. Alper, *Good moduli spaces for Artin stacks*, Ann. Inst. Fourier 63 (2013), no. 6, 2349–2402, arXiv:0804.2242: Theorem 10.3, 9.1.
