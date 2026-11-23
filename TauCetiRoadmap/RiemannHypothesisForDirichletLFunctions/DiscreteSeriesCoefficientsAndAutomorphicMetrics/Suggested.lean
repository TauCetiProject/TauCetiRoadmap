import Mathlib

/-!
# Discrete series coefficients and automorphic metrics: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, so nothing is stated here.

Every headline is a statement about a reductive group: the representations of a real reductive
Lie group (AutomorphicFormsOnReductiveGroups Layer 2), the algebraic modular forms of a reductive
group over a number field that is compact at infinity (AutomorphicFormsOnReductiveGroups
§§7.4–7.5), or the automorphic vector bundles on a toroidal compactification of a Shimura variety
(AutomorphicBundles Layer 5). Mathlib has Lie groups (`LieGroup`), continuous representations on
topological vector spaces (`ContRepresentation`), Haar measures, the adele rings
`NumberField.AdeleRing` and `IsDedekindDomain.FiniteAdeleRing`, the unitary group of the standard
Hermitian form (`Matrix.unitaryGroup`) and the indefinite diagonal form
`LieAlgebra.Orthogonal.indefiniteDiagonal`; Tau Ceti has trace-class operators between Hilbert
spaces (`TauCeti.OperatorIdealFamily.traceClass`). Neither has reductive groups over a field with
their real or adelic points, Harish-Chandra parameters, discrete series, Shimura varieties or
Chern classes.

* The formal degree of a discrete series (8.3): for a connected real reductive group with a maximal
  compact subgroup `K` and a Cartan subgroup compact modulo its split centre `A_G`, and the Haar
  measure on `G/A_G` normalised by the Haar probability measure of the compact dual containing `K`,
  the discrete series of regular Harish-Chandra parameter `λ` has formal degree
  `∏_{α>0} |⟨λ, α^∨⟩| / ∏_{α>0} ⟨ρ, α^∨⟩`. It lacks real reductive groups with their Cartan
  decomposition and compact dual, the discrete series with their Harish-Chandra parameters, and the
  formal degree of a square-integrable irreducible unitary representation.
* The lowest-`K`-type coefficients of gapped discrete series of `U(p, q)` (2.4a (b), (c)): for
  `p, q ≥ 1`, `n = p + q`, `q₀ = min(p, q)` and the discrete series `σ` of Harish-Chandra parameter `λ` whose
  entries of different signs are at least `h ≥ 120·n·q₀^{3/2}` apart, the compression of `σ` to its
  lowest `K`-type isotypic subspace `V_Λ` is, on `exp 𝔭`, the `K`-average of the explicit product
  `Φ_λ` of powers of leading principal minors, and
  `|⟨σ(g)u, v⟩| ≤ exp(−(h/8)·min(d(g)², d(g)/√(2q₀)))·‖u‖·‖v‖` for `u, v ∈ V_Λ`, where
  `d(k·exp X) = ‖X‖_HS`. It lacks the discrete series of `U(p, q)` as irreducible unitary
  representations on Hilbert spaces with square-integrable coefficients, with their parameters,
  lowest `K`-types and isotypic subspaces.
* The mass and the dimension of spaces of algebraic modular forms (7.5a, 7.5c): for a connected
  reductive group `G` over a number field `F`, compact at infinity modulo `A_∞`, with `Z_G(F)`
  discrete in `Z_G(𝔸_f)`, a compact open `J ⊂ G(𝔸_f)` and a finite free coefficient module `M`
  over a field of characteristic zero, `vol(G(F)A_∞\G(𝔸)) = vol(G_∞J/A_∞)·mass J` and
  `dim S(J, M) = Σ_i |Γ_i|⁻¹ Σ_{γ∈Γ_i} tr ρ_i(γ)`. It lacks connected reductive groups over a
  number field with their adelic points as topological groups, the class set `G(F)\G(𝔸_f)/J` with
  its stabilisers `Γ_i`, the space `S(J, M)` of algebraic modular forms, and the quotient measure on
  `G(F)A_∞\G(𝔸)`.
* Good invariant metrics and Hirzebruch–Mumford proportionality (10.1, 10.2): for a Shimura datum
  with a neat level and a smooth projective toroidal compactification with simple normal crossings
  boundary, the invariant metric on an automorphic vector bundle is good relative to the canonical
  extension, and every top-degree Chern number of canonical extensions is `κ_K` times the
  corresponding Chern number of the homogeneous bundles on the compact dual. It lacks Shimura data
  and Shimura varieties, toroidal compactifications, automorphic vector bundles with their
  canonical extensions and invariant metrics, good metrics, compact duals, Chern classes and Chern
  numbers, topological Euler characteristics of complex varieties, and flag bundles.

The kernel bound 2.4a (a), an inequality between `Φ_λ(k⁻¹·exp(X)·k)` and `‖X‖_HS` for matrices,
and the bound 6.8a for Poincaré series of a discrete subgroup of `U(p, q)^f` on products of the
domain `{Z : 1 − ZZ^* > 0}`, are statements about matrices and are statable with Mathlib's
matrices, determinants and discrete subgroups; neither is a headline, so neither is stated. The
finite-group core of 7.5c, `dim M^Γ = |Γ|⁻¹ Σ_{γ∈Γ} tr ρ(γ)` for a finite group, is Mathlib's
`FDRep.average_char_eq_finrank_invariants`. The same dimension formula for an arbitrary group with
finitely many double cosets `Γ\G₀/J` and finite stabilisers would be a more general statement than
the roadmap's 7.5c, so it is not stated. The trace-class statement 9.1 is not a headline; it lacks,
besides the adelic group, the Hilbert space `L²([G]¹)` with its cuspidal and discrete subspaces and
the operators `R(f)`.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.DiscreteSeriesCoefficientsAndAutomorphicMetrics

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.DiscreteSeriesCoefficientsAndAutomorphicMetrics
